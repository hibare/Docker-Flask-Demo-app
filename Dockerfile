FROM python:3-slim@sha256:44dd04494ee8f3b538294360e7c4b3acb87c8268e4d0a4828a6500b1eff50061

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
