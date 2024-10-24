FROM mysql:latest

ENV MYSQL_USER=ctfnote_user
ENV MYSQL_ROOT_PASSWORD=root_password
ENV MYSQL_DATABASE=ctfnote
ENV MYSQL_PASSWORD=ctfnote_password

COPY ctfnote-db.sql /docker-entrypoint-initdb.d/

EXPOSE 3306

CMD ["mysqld"]