# Використовуємо офіційний образ Python
FROM python:3.10-slim

# Оновлюємо pip
RUN pip install --upgrade pip

# Встановлюємо робочу директорію
WORKDIR /app

# Копіюємо всі файли проєкту в контейнер
COPY . /app

# Встановлюємо залежності
RUN pip install --no-cache-dir -r requirements.txt

# Відкриваємо порт для FastAPI
EXPOSE 8000

# Запускаємо застосунок за допомогою Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
