FROM ubuntu:18.04

ENV TZ=Europe/Moscow
RUN apt update && apt install -y apache2

ADD assets/index.html /var/www/html/index.html

EXPOSE 80
CMD apachectl -D FOREGROUND