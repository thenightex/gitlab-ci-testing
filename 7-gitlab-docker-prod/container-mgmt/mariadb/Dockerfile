FROM mariadb:10.4

ADD eldix4kim.cnf /etc/mysql/mariadb.conf.d/
ADD 0-init.sql /docker-entrypoint-initdb.d
ADD 1-init.sql /docker-entrypoint-initdb.d

RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime

EXPOSE 3306
