#!/bin/bash

if [ -d /app/mysql ]; then
	echo "MySql Dir is already created skiping database creation !"
else
	echo "MySql Dir is not found, Installing Database";
	mysql_install_db --user=wordpressuser > /dev/null

	if ["$MYSQL_ROOT_PASSWORD" = "" ]; then
		MYSQL_ROOT_PASSWORD=root
		echo "mySql root pass -- > $MYSQL_ROOT_PASSWORD"
	fi
	MYSQL_DATABASE=wordpress
	MYSQL_USER=wordpressuser
	MYSQL_PASSWORD=root
	if [ ! -d "/run/mysqld" ]; then
		mkdir -p /run/mysqld
	fi

	tmpfile=`mktmp`
	if [ ! -f "$tmpfile" ]; then
		return 1
	fi

	cat << EOF > $tmpfile
USE mysql;
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY "$MYSQL_ROOT_PASSWORD" WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'localhost' WITH GRANT OPTION;
UPDATE user SET password=PASSWORD("") WHERE user='root AND host='localhost';
EOF

if [ "$MYSQL_DATABASE" != "" ]; then
	echo "creating database - > $MYSQL_DATABASE"
	echo "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\` CHARACTER SET utf8 COLLATE utf8_general_ci;" >> $tmpfile

	if [ $MYSQL_USER != "" ]; then
		echo "Creating user : $MYSQL_USER with password $MYSQL_PASSWORD"
		echo "GRANT ALL ON \`$MYSQL_DATABASE\`.* to '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> $tmpfile
	fi
fi

/usr/bin/mysqld --user=wordpressuser --bootstrap --verbose=0 < $tmpfile
rm -f $tmpfile
fi

exec /user/bin/mysqld --user=wordpressuser --console