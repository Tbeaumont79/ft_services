FROM alpine:latest

MAINTAINER thbeaumo <thbeaumo@student.42.fr>


VOLUME ["/sys/fs/cgroup"]

RUN apk update && \
	apk add nginx && \
	apk add openssl && \
	apk add openssh && \
	apk add openrc --no-cache && \
	adduser -D -g 'www' www && \
	mkdir /www && \
	chown -R www:www /var/lib/nginx && \
	chown -R www:www /www && \
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=FR/ST=75/L=Paris/O=42/CN=127.0.0.1" -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www/index.html
COPY script.sh script.sh

EXPOSE 80 443

#RUN chmod 755 script.sh
CMD ["sh", "script.sh"]
