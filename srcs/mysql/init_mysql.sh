#!/bin/bash

if [ ! -d /run/mysqld ]; then
    mkdir -p /run/mysqld
fi
if [ -d /var/lib/mysql/mysql ]; then
    echo "mysql dir is already present skipping the creation !"
else
	echo "MySql Dir is not found, Installing Database";
	mysql_install_db --user=mysql > /dev/null

	echo "mySql root pass -- > $MYSQL_ROOT_PASSWORD"
	tmpfile=`mktmp`
	if [ ! -f "$tmpfile" ]; then
		return 1
	fi

	cat << EOF > $tmpfile
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY "$MYSQL_ROOT_PASSWORD" WITH GRANT OPTION;
EOF
    echo "FLUSH PRIVILEGES;" >> $tmpfile
    /usr/bin/mysqld --user=root --bootstrap --verbose=0 < $tmpfile
    rm -f $tmpfile
fi

echo "mysql is running in "
echo "1"
sleep 1
echo "2"
sleep 1
echo "3"
sleep 1
echo "4"
sleep 2
echo "start runing !"
exec /usr/bin/mysqld --user=mysql --console
