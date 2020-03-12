from alpine:latest

MAINTAINER thbeaumo	<thbeaumo@student.42.fr>

VOLUME ["/sys/fs/cgroup"]

RUN apk add wget php7-zlib

RUN apk update && \
	apk add lighttpd mysql mysql-client php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom && \
	sed -i 's/\/run\/lighttpd.pid/\/run\/lighttpd\/php-fast-cgi.socket/g' /etc/lighttpd/lighttpd.conf && \
	sed -i 's/#   include "mod_fastcgi.conf"/include "mod_fastcgi.conf"/g' /etc/lighttpd/lighttpd.conf && \
	sed -i 's/\/usr\/bin\/php-cgi/\/usr\/bin\/php-cgi7/g' /etc/lighttpd/mod_fastcgi.conf && \
	apk add openrc --no-cache && \
	openrc && \
	touch /run/openrc/softlevel && \
	/etc/init.d/lighttpd restart && \
	mkdir -p /usr/share/webapps/ && \
	cd /usr/share/webapps/ && \
	wget http://wordpress.org/latest.tar.gz && \
	tar -xzvf latest.tar.gz && \
	rm latest.tar.gz && \
	chown -R lighttpd /usr/share/webapps/ && \
	ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress

COPY wp-config.php /usr/share/weapps/wordpress
COPY handledatabase handledatabase
COPY script.sh script.sh

RUN chmod 755 script.sh

EXPOSE 5050

CMD ["./script.sh"]


