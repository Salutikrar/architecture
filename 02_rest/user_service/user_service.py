from fastapi import FastAPI, HTTPException, Depends, status
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from pydantic import BaseModel
from typing import List, Optional
from datetime import datetime, timedelta
from jose import JWTError, jwt
from passlib.context import CryptContext

# Секретный ключ для подписи JWT
SECRET_KEY = "your-secret-key"
ALGORITHM = "HS256"
ACCESS_TOKEN_EXPIRE_MINUTES = 30

app = FastAPI()

# Модель данных для пользователя
class User(BaseModel):
    username: str
    surname: str
    name: str
    patronymic: Optional[str] = None
    age: Optional[int] = None
    email: str
    hashed_password: str

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

# Зависимости для получения текущего пользователя
async def get_current_client(token: str = Depends(oauth2_scheme)):
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

# Маршрут для получения токена
@app.post("/token")
async def login_for_access_token(form_data: OAuth2PasswordRequestForm = Depends()):
    password_check = False
    if form_data.username in client_db:
        password = client_db[form_data.username]
        if pwd_context.verify(form_data.password, password):
            password_check = True

    if password_check:
        access_token_expires = timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
        access_token = create_access_token(data={"sub": form_data.username}, expires_delta=access_token_expires)
        return {"access_token": access_token, "token_type": "bearer"}
    else:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Incorrect username or password",
            headers={"WWW-Authenticate": "Bearer"},
        )

# GET /users - Получить всех пользователей (требует аутентификации)
@app.get("/users", response_model=List[User])
def get_users(current_user: str = Depends(get_current_client)):
    return users_db

# GET /users/{username} - Получить пользователя по логину (требует аутентификации)
@app.get("/users/{username}", response_model=User)
def get_user(username: str, current_user: str = Depends(get_current_client)):
    for user in users_db:
        if user.username == username:
            return user
    raise HTTPException(status_code=404, detail="User not found")

# GET /users/{name_mask} - Поиск пользователей по маске имя и фамилия
@app.get("/users/search/{name_mask}", response_model=List[User])
def search_users_by_name(name_mask: str, current_user: str = Depends(get_current_client)):
    results = []
    name_mask_lower = name_mask.lower()
    for user in users_db:
        if (name_mask_lower in user.name.lower() or
            name_mask_lower in user.surname.lower()):
            results.append(user)
        elif name_mask_lower in (user.name.lower() + " " + user.surname.lower()):
            results.append(user)
        elif name_mask_lower in (user.surname.lower() + " " + user.name.lower()):
            results.append(user)
    if (results == []):
        raise HTTPException(status_code=404, detail="Results not found")
    return results

# POST /users - Создать нового пользователя (требует аутентификации)
@app.post("/users", response_model=User)
def create_user(user: User, current_user: str = Depends(get_current_client)):
    if user.username in client_db:
        raise HTTPException(status_code=404, detail="User already exist")
    users_db.append(user)
    client_db[user.username] = user.hashed_password
    return user

# PUT /users/{username} - Обновить пользователя по username (требует аутентификации)
@app.put("/users/{username}", response_model=User)
def update_user(username: str, updated_user: User, current_user: str = Depends(get_current_client)):
    if username == "admin":
        raise HTTPException(status_code=403, detail="Admin account cannot be modified")
    if updated_user.username == "admin":
        raise HTTPException(status_code=403, detail="Cannot create or rename user to 'admin'")
    user_index = next((i for i, user in enumerate(users_db) if user.username == username), None)
    if user_index is None:
        raise HTTPException(status_code=404, detail="User not found")
    if updated_user.username != username and any(u.username == updated_user.username for u in users_db):
        raise HTTPException(status_code=400, detail="Username already taken")
    users_db[user_index] = updated_user
    client_db[updated_user.username] = updated_user.hashed_password
    if updated_user.username != username:
        del client_db[username]
    return updated_user

# DELETE /users/{username} - Удалить пользователя по username (требует аутентификации)
@app.delete("/users/{username}", response_model=User)
def delete_user(username: str, current_user: str = Depends(get_current_client)):
    for index, user in enumerate(users_db):
        if user.username == username:
            deleted_user = users_db.pop(index)
            return deleted_user
    raise HTTPException(status_code=404, detail="User not found")

# Запуск сервера
# http://localhost:8000/openapi.json swagger
# http://localhost:8000/docs портал документации

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
