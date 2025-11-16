FROM python:3.11-alpine AS python-builder

RUN apk add --no-cache build-base jpeg-dev zlib-dev

RUN pip install --no-cache-dir pillow onnxruntime rembg

FROM n8nio/n8n:latest

USER root

RUN apk add --no-cache python3 jpeg zlib libstdc++

COPY --from=python-builder /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages
COPY --from=python-builder /usr/local/bin/rembg /usr/local/bin/rembg

RUN ln -sf python3 /usr/bin/python

USER node
