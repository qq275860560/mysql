[TOC]
jenkins主节点镜像

# 适用场景
适用于开发测试环境

# 功能
## mysql安装
## 配置账号root密码123456
## 配置远程访问权限为任何机器

# 使用方式
```
docker pull qq275860560/mysql
(docker kill mysql || true) && (docker rm mysql || true) 
docker run -d -p 3306:3306 --name mysql qq275860560/mysql 

```

或者

```
docker pull qq275860560/mysql
(docker kill mysql || true) && (docker rm mysql || true) 
docker run -d -p 3306:3306 --name mysql qq275860560/mysql /bin/bash -c 'source /etc/profile &&\
    /usr/sbin/sshd &&\
    chmod -R 777 /var/lib/mysql /usr/share/mysql /var/run/mysqld &&\
    chown -R root:root /var/lib/mysql /usr/share/mysql /var/run/mysqld &&\
    /usr/sbin/mysqld  --defaults-file=/etc/my.cnf --user=root --daemonize && tail -f /var/log/lastlog'

```

或者

```
docker pull qq275860560/mysql
(docker kill mysql || true) && (docker rm mysql || true) 
docker run -it -p 3306:3306 --name mysql qq275860560/mysql /bin/bash

#容器内执行
chmod -R 777 /var/lib/mysql /usr/share/mysql /var/run/mysqld &&\
    chown -R root:root /var/lib/mysql /usr/share/mysql /var/run/mysqld &&\
    /usr/sbin/mysqld  --defaults-file=/etc/my.cnf --user=root --daemonize

```

# 温馨提醒

* 此项目将会长期维护，增加或改进实用的功能
* 右上角点击star，给我继续前进的动力,谢谢