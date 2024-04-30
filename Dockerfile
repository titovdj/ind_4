FROM python:3.10
RUN mkdir /fastapi_app
WORKDIR /fastapi_app
COPY req.txt .
RUN pip install -r req.txt
COPY . .
#RUN alembic upgrade head
CMD gunicorn main:app --workers 2 --worker-class uvicorn.workers.UvicornWorker --bind=0.0.0.0:8000