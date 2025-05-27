# Используем официальный образ Python 3.11
FROM python:3.11-slim

# Устанавливаем рабочую директорию
WORKDIR /workspace

# RUN apt-get update && apt-get install -y \
#     build-essential \
#     postgresql \
#     postgresql-contrib \
#     && rm -rf /var/lib/apt/lists/*

# Копируем зависимости
COPY requirements.txt .

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Копируем остальные файлы проекта
COPY . .

# Открываем порт 8000 для FastAPI
EXPOSE 8000

CMD ["python", "./presentation_producer/presentation_producer.py"]
