FROM python:3.11-slim

USER root

RUN pip install --no-cache-dir rembg

RUN apt-get update && \
    apt-get install -y curl gosu tini && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g n8n && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m -u 1000 node

USER node

WORKDIR /home/node

ENV N8N_USER_FOLDER=/home/node/.n8n

EXPOSE 5678

CMD ["n8n"]
