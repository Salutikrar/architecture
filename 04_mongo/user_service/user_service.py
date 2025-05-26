from fastapi import FastAPI, HTTPException, Depends, status
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from pydantic import BaseModel
from typing import List, Optional
from datetime import datetime, timedelta
from jose import JWTError, jwt
from passlib.context import CryptContext
from sqlalchemy import create_engine, Column, Integer, String, func
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker, Session
import os

# Секретный ключ для подписи JWT
SECRET_KEY = "your-secret-key"
ALGORITHM = "HS256"
ACCESS_TOKEN_EXPIRE_MINUTES = 30

DATABASE_URL = os.getenv("DATABASE_URL", "postgresql://postgres:postgres@db/postgres")

app = FastAPI()

engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()

class DBUser(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True)
    username = Column(String(50), unique=True, index=True)
    surname = Column(String(100), index=True)
    name = Column(String(100), index=True)
    patronymic = Column(String(100), nullable=True)
    age = Column(Integer, nullable=True)
    email = Column(String(100))
    hashed_password = Column(String(200))

Base.metadata.create_all(bind=engine)

# Модель данных для пользователя
class UserBase(BaseModel):
    username: str
    surname: str
    name: str
    patronymic: Optional[str] = None
    age: Optional[int] = None
    email: str

class UserCreate(UserBase):
    password: str

class User(UserBase):
    hashed_password: str

    class Config:
        orm_mode = True


# Временное хранилище для пользователей
users_db = []

# Псевдо-база данных пользователей
client_db = {
    "admin":  "$2b$12$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW"  # hashed "secret"
}

# Настройка паролей
pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

# Настройка OAuth2
oauth2_scheme = OAuth2PasswordBearer(tokenUrl="token")

# Зависимости для получения сессии базы данных
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# Зависимости для получения текущего пользователя
async def get_current_client(token: str = Depends(oauth2_scheme), db: Session = Depends(get_db)):
    credentials_exception = HTTPException(
        status_code=status.HTTP_401_UNAUTHORIZED,
        detail="Could not validate credentials",
        headers={"WWW-Authenticate": "Bearer"},
    )
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        username: str = payload.get("sub")
        if username is None:
            raise credentials_exception
        else:
            user = db.query(DBUser).filter(DBUser.username == username).first()
            if user is None:
                raise credentials_exception
            return username
    except JWTError:
        raise credentials_exception

# Создание и проверка JWT токенов
def create_access_token(data: dict, expires_delta: Optional[timedelta] = None):
    to_encode = data.copy()
    if expires_delta:
        expire = datetime.utcnow() + expires_delta
    else:
        expire = datetime.utcnow() + timedelta(minutes=15)
    to_encode.update({"exp": expire})
    encoded_jwt = jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
    return encoded_jwt



# Инициализация администратора
def init_admin():
    with SessionLocal() as db:
        admin = db.query(DBUser).filter(DBUser.username == "admin").first()
        if not admin:
            hashed_password = pwd_context.hash("secret")
            admin = DBUser(
                username="admin",
                surname="Adminov",
                name="Admin",
                email="admin@example.com",
                hashed_password=hashed_password
            )
            db.add(admin)
            db.commit()
init_admin()

# Маршрут для получения токена
@app.post("/token")
async def login_for_access_token(form_data: OAuth2PasswordRequestForm = Depends(), db: Session = Depends(get_db)):
    user = db.query(DBUser).filter(DBUser.username == form_data.username).first()
    if not user or not pwd_context.verify(form_data.password, user.hashed_password):
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Incorrect username or password",
            headers={"WWW-Authenticate": "Bearer"},
        )

    access_token_expires = timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
    access_token = create_access_token(data={"sub": form_data.username}, expires_delta=access_token_expires)
    return {"access_token": access_token, "token_type": "bearer"}


# GET /users - Получить всех пользователей (требует аутентификации)
@app.get("/users", response_model=List[User])
def get_users(current_user: str = Depends(get_current_client), db: Session = Depends(get_db)):
    return db.query(DBUser).all()

# GET /users/{username} - Получить пользователя по логину (требует аутентификации)
@app.get("/users/{username}", response_model=User)
def get_user(username: str, current_user: str = Depends(get_current_client), db: Session = Depends(get_db)):
    user = db.query(DBUser).filter(DBUser.username == username).first()
    if not user:
        raise HTTPException(status_code=404, detail="User not found")
    return user

# GET /users/search/{name_mask} - Поиск пользователей по маске имя и фамилия
@app.get("/users/search/{name_mask}", response_model=List[User])
def search_users_by_name(name_mask: str, current_user: str = Depends(get_current_client), db: Session = Depends(get_db)):
    if not name_mask:
        raise HTTPException(status_code=400, detail="Search mask cannot be empty")

    name_mask = f"%{name_mask.lower()}%"
    users = db.query(DBUser).filter(
        DBUser.name.ilike(name_mask) |
        DBUser.surname.ilike(name_mask) |
        func.concat(DBUser.surname, " ", DBUser.name).ilike(name_mask) |
        func.concat(DBUser.name, " ", DBUser.surname).ilike(name_mask)
    ).all()
    if not users:
        raise HTTPException(status_code=404, detail="Results not found")
    return users

# POST /users - Создать нового пользователя (требует аутентификации)
@app.post("/users", response_model=User)
def create_user(user: UserCreate, current_user: str = Depends(get_current_client), db: Session = Depends(get_db)):
    db_user = db.query(DBUser).filter(DBUser.username == user.username).first()
    if db_user:
        raise HTTPException(status_code=404, detail="User already exist")
    hashed_password = pwd_context.hash(user.password)
    db_user = DBUser(
        **user.dict(exclude={"password"}),
        hashed_password=hashed_password
    )
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    return db_user

# PUT /users/{username} - Обновить пользователя по username (требует аутентификации)
@app.put("/users/{username}", response_model=User)
def update_user(username: str, updated_user: UserCreate, current_user: str = Depends(get_current_client), db: Session = Depends(get_db)):
    if username == "admin":
        raise HTTPException(status_code=403, detail="Admin account cannot be modified")
    if updated_user.username == "admin":
        raise HTTPException(status_code=403, detail="Cannot create or rename user to 'admin'")
    db_user = db.query(DBUser).filter(DBUser.username == username).first()
    if not db_user:
        raise HTTPException(status_code=404, detail="User not found")
    if updated_user.username != username and db.query(DBUser).filter(DBUser.username == updated_user.username).first():
        raise HTTPException(status_code=400, detail="Username already taken")
    hashed_password = pwd_context.hash(updated_user.password)
    new_user = updated_user.dict(exclude={"password"})
    for field, value in new_user.items():
        setattr(db_user, field, value)
    for field, value in new_user.items():
        if (field != id):
            setattr(db_user, field, value)
    db_user.hashed_password = hashed_password

    db.commit()
    db.refresh(db_user)
    return db_user

# DELETE /users/{username} - Удалить пользователя по username (требует аутентификации)
@app.delete("/users/{username}", response_model=User)
def delete_user(username: str, current_user: str = Depends(get_current_client), db: Session = Depends(get_db)):
    if username == "admin":
        raise HTTPException(status_code=403, detail="Admin account cannot be deleted")
    db_user = db.query(DBUser).filter(DBUser.username == username).first()
    if not db_user:
        raise HTTPException(status_code=404, detail="User not found")
    db.delete(db_user)
    db.commit()
    return db_user

# Запуск сервера
# http://localhost:8000/openapi.json swagger
# http://localhost:8000/docs портал документации

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
