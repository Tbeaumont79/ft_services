#!/bin/sh
/usr/bin/mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql && \
rc-service mariadb start && rc-update add mariadb default && \
/usr/bin/mysqladmin -u root password 'password' && \
mysql -u root -p="password" < handledatabase
tail