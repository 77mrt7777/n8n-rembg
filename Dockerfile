# 1) Ubuntu/Debian tabanlı n8n imajına geç
FROM n8nio/n8n:latest-ubuntu

USER root
# 2) Python ve pip kur, sonra rembg + pillow yükle
RUN apt-get update && apt-get install -y python3 python3-pip && \
    pip3 install --no-cache-dir rembg pillow && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

USER node
