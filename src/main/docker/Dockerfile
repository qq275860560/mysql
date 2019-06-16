FROM qq275860560/base

MAINTAINER jiangyuanlin@163.com

RUN wget http://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm &&\
    yum -y install mysql57-community-release-el7-11.noarch.rpm  &&\
    yum repolist enabled | grep mysql.*   &&\
    yum -y install mysql-community-server  &&\
    rm -rf /var/cache/yum/*
	
CMD source /etc/profile &&\
     service sshd start &&\
     service mysql start 	

 
