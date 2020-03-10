FROM alpine:latest

MAINTAINER thbeaumo <thbeaumo@student.42.fr>


VOLUME ["/sys/fs/cgroup"]

RUN apk update && \
	apk add nginx && \
	apk add openrc --no-cache && \
	adduser -D -g 'www' www && \
	mkdir /www && \
	chown -R www:www /var/lib/nginx && \
	chown -R www:www /www

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www/index.html
#COPY script.sh script.sh

#RUN chmod 755 script.sh
RUN openrc
RUN touch /run/openrc/softlevel
RUN rc-service nginx start 
RUN nginx -t
CMD ["nginx", "-g", "daemon off;"]
