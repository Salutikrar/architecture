from fastapi import FastAPI, HTTPException, Depends, status
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from pydantic import BaseModel
from typing import List, Optional
from jose import JWTError, jwt

# Секретный ключ для подписи JWT
SECRET_KEY = "your-secret-key"
ALGORITHM = "HS256"
ACCESS_TOKEN_EXPIRE_MINUTES = 30

app = FastAPI(
    swagger_ui_parameters={
        "defaultModelsExpandDepth": -1,
        "docExpansion": "none",
        "displayRequestDuration": True,
        "showExtensions": True
    }
)

# Модель данных для пользователя
class Presentation(BaseModel):
    title: str
    description: str
    speaker: str

presentations_db = []

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
    return presentations_db

# POST /presentations - Создать новый доклад (требует аутентификации)
@app.post("/presentations", response_model=Presentation)
def create_presentation(presentation: Presentation, current_user: str = Depends(get_current_client)):
    if any(p.title == presentation.title for p in presentations_db):
        raise HTTPException(status_code=404, detail="Presentation with such title already exist")
    presentations_db.append(presentation)
    return presentation



# PUT /presentations/{title} - Обновить доклад по title (требует аутентификации)
@app.put("/presentations/{title}", response_model=Presentation)
def update_presentation(title: str, updated_presentation: Presentation, current_user: str = Depends(get_current_client)):
    presentation_index = next((i for i, p in enumerate(presentations_db) if p.title == title), None)
    if presentation_index is None:
        raise HTTPException(status_code=404, detail="Presentation not found")
    if (updated_presentation.title != title and
        any(p.title == updated_presentation.title for p in presentations_db)):
        raise HTTPException(status_code=400, detail="Presentation with this title already exists")
    presentations_db[presentation_index] = updated_presentation
    return updated_presentation

# DELETE /presentations/{title} - Удалить доклад по title (требует аутентификации)
@app.delete("/presentations/{title}", response_model=Presentation)
def delete_presentation(title: str, current_user: str = Depends(get_current_client)):
    for index, presentation in enumerate(presentations_db):
        if presentation.title == title:
            deleted_presentation = presentations_db.pop(index)
            return deleted_presentation
    raise HTTPException(status_code=404, detail="Presentation whith such title not found")

# Запуск сервера
# http://localhost:8000/openapi.json swagger
# http://localhost:8000/docs портал документации

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
