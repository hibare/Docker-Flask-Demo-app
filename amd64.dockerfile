FROM amd64/python:3-alpine

LABEL authors="Hibare (docker@hibare.in)"

ENV APP_DIR /src

RUN mkdir ${APP_DIR}
WORKDIR ${APP_DIR}

COPY app.py .
COPY requirements.txt .

RUN pip3 install -r requirements.txt

EXPOSE 5000

ENTRYPOINT ["python3"]
CMD ["app.py"]
