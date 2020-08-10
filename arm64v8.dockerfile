
FROM alpine AS builder

# Download QEMU, see https://github.com/docker/hub-feedback/issues/1261
ENV QEMU_URL https://github.com/balena-io/qemu/releases/download/v3.0.0%2Bresin/qemu-3.0.0+resin-aarch64.tar.gz
RUN apk add curl && curl -L ${QEMU_URL} | tar zxvf - -C . --strip-components 1


FROM arm64v8/python:3-alpine

# Add QEMU
COPY --from=builder qemu-aarch64-static /usr/bin

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
