FROM python:3-slim@sha256:c845af9399020c7e562969a13689e929074a10fd057acd1b1fad06a2fb068e97

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
