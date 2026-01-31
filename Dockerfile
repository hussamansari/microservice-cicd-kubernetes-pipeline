
FROM python:2.7

ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY django/requirements.txt .
RUN pip install -r requirements.txt
RUN pip install psycopg2

COPY django/ .

EXPOSE 5000
