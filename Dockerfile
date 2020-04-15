FROM alpine:latest
LABEL MAINTAINER https://github.com/DIYgod/download-webhook

WORKDIR /app

COPY . /app

RUN apk add --no-cache tzdata npm python3 ffmpeg && \
        cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
        pip3 install --no-cache-dir you-get && \
        npm install ; chown -R 1000:1000 . && \
        apk del -qq --purge tzdata && \
        rm -rf /var/cache/apk/*

EXPOSE 3000
CMD ["npm", "run", "start"]
