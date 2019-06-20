#!/bin/bash
set -xev
source /etc/profile
#
echo "当前目录"
SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)
echo ${SHELL_FOLDER}
cd ${SHELL_FOLDER}
#

/usr/sbin/mysqld --defaults-file=/etc/my.cnf  --initialize --user=root
/usr/sbin/mysqld  --defaults-file=/etc/my.cnf --user=root --daemonize
newPassword=123456
oldPassword=`grep "password" /var/log/mysqld.log | awk -F ': '  '{print $2}'`
echo $oldPassword
/usr/bin/expect<<-EOF
spawn mysql -uroot -p
expect {
"Enter password:" {send "$oldPassword\r"}
}
expect "mysql>"
send " alter user 'root'@'localhost' IDENTIFIED BY '$newPassword';\r"
expect "mysql>"
send "use mysql;\r" 
expect "mysql>"
send "update user set host = '%', plugin='mysql_native_password' where user = 'root';\r" 
expect "mysql>"
send "flush privileges;\r"
expect "mysql>"
send "exit\r"
interact
expect eof
EOF

/usr/bin/expect<<-EOF
set timeout -1
spawn  mysqladmin shutdown -uroot -p
expect {
"Enter password:" {send "$newPassword\r"}
}
interact
expect eof
EOF

chmod -R 777 /var/lib/mysql /var/log /usr/share/mysql /var/run/mysqld
chown -R root:root /var/lib/mysql /var/log /usr/share/mysql /var/run/mysqld
