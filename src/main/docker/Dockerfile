FROM qq275860560/base

MAINTAINER jiangyuanlin@163.com

RUN  yum -y install  http://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm &&\
    yum repolist enabled | grep mysql.*   &&\
    yum -y install mysql-community-server  &&\
    rm -rf /var/cache/yum/*
 
RUN echo "expect eof" && curl -fsSL "https://raw.githubusercontent.com/qq275860560/mysql/master/src/main/centos/tmp/init.sh" | sh

CMD source /etc/profile &&\
    /usr/sbin/sshd &&\
    /usr/sbin/mysqld  --defaults-file=/etc/my.cnf --user=root --daemonize 	

 
