FROM alpine:latest

MAINTAINER thbeaumo <thbeaumo@student.42.fr>

RUN apk update && \
    apk add openrc --no-cache && \
    apk add pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache && \
    {echo "admin"; echo "admin"; } | adduser user && \

COPY script.sh script.sh

EXPOSE 21 21000

CMD ["sh", "script.sh"]
