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

RUN pip3 install --break-system-packages --no-cache-dir pillow onnxruntime rembg

USER node
