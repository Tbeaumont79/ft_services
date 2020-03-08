FROM alpine:latest

MAINTAINER thbeaumo thbeaumo@student.42.fr

VOLUME /var/lib/mysql

COPY init_mysql.sh /bin/init_mysql.sh

RUN chmod 777 /bin/init_mysql.sh

RUN apk add --update mysql mysql-client && rm -f /var/cache/apk/*

COPY my.cnf /etc/mysql/my.cnf


EXPOSE 3306

CMD ["./bin/init_mysql.sh"] 