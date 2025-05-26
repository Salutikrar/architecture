from fastapi import FastAPI, HTTPException, Depends, status
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from pydantic import BaseModel
from typing import List, Optional
from jose import JWTError, jwt
from pymongo import MongoClient
from pymongo.errors import DuplicateKeyError
import os

# Секретный ключ для подписи JWT
SECRET_KEY = "your-secret-key"
ALGORITHM = "HS256"
ACCESS_TOKEN_EXPIRE_MINUTES = 30

# Подключение к MongoDB
client = MongoClient(os.getenv("MONGO_URL", "mongodb://mongodb:27017"))
db = client['conference_db']
presentations_col = db['presentations']

app = FastAPI()

# Модель данных для пользователя
class Presentation(BaseModel):
    title: str
    description: str
    speaker: str

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
        return username
    except JWTError:
        raise credentials_exception


# GET /presentations - Получить все доклады (требует аутентификации)
@app.get("/presentations", response_model=List[Presentation])
def get_presentations(current_user: str = Depends(get_current_client)):
    result = presentations_col.find()
    # users = db.query(User).all()
    return result

# POST /presentations - Создать новый доклад (требует аутентификации)
@app.post("/presentations", response_model=Presentation)
def create_presentation(presentation: Presentation, current_user: str = Depends(get_current_client)):
    doc = {**presentation.dict()}
    try:
        presentations_col.insert_one(doc)
        return presentation
    except DuplicateKeyError:
        raise HTTPException(400, "Presentation with this title exists")



# PUT /presentations/{title} - Обновить доклад по title (требует аутентификации)
@app.put("/presentations/{title}", response_model=Presentation)
def update_presentation(title: str, presentation: Presentation, current_user: str = Depends(get_current_client)):
    existing = presentations_col.find_one({"title": title})
    if not existing:
        raise HTTPException(404, "Presentation not found")

    if title != presentation.title:
        if presentations_col.find_one({"title": presentation.title}):
            raise HTTPException(400, "New title already exists")

    presentations_col.update_one(
        {"title": title},
        {"$set": {**presentation.dict()}}
    )
    return presentation

# DELETE /presentations/{title} - Удалить доклад по title (требует аутентификации)
@app.delete("/presentations/{title}", response_model=Presentation)
def delete_presentation(title: str, current_user: str = Depends(get_current_client)):
    presentation = presentations_col.find_one_and_delete({"title": title})
    if not presentation:
        raise HTTPException(404, "Presentation not found")
    return Presentation(**presentation)

# Запуск сервера
# http://localhost:8000/openapi.json swagger
# http://localhost:8000/docs портал документации

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
