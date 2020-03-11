#!/bin/sh
openrc
touch /run/openrc/softlevel
rc-service nginx start
rc-update add sshd
tail -f /var/log/nginx/access.log /var/log/nginx/error.log