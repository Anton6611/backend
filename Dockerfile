# Используем образ Python 3.12
FROM python:3.12
# Устанавливаем рабочий каталог в /app
RUN python3 -m pip install flask
RUN mkdir /app
WORKDIR /app
# Копируем файл requirements.txt в рабочий каталог
COPY requirements.txt .
# Устанавливаем зависимости из файла requirements.txt
RUN pip install -r requirements.txt
# Обновляем список пакетов
RUN apt-get update
#RUN apt-get install -y python-pip python-dev build-essential
# Копируем текущий каталог в рабочий каталог
COPY . .
# Устанавливаем переменную окружения FLASK_APP для работы с Flask
ENV FLASK_APP=main.py
# Открываем порт 8000 для работы с приложением
EXPOSE 8000
# Устанавливаем команду для запуска приложения
CMD ["flask", "run", "--host=0.0.0.0", "--port=8000"]