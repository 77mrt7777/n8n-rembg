FROM n8nio/n8n:latest

USER root

RUN apk add --no-cache \
    python3 \
    py3-pip \
    build-base \
    python3-dev \
    jpeg-dev \
    zlib-dev

RUN ln -sf python3 /usr/bin/python

RUN pip3 install --no-cache-dir --upgrade pip

RUN pip3 install --no-cache-dir pillow

RUN pip3 install --no-cache-dir onnxruntime

RUN pip3 install --no-cache-dir rembg

USER node
