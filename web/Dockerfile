FROM ubuntu
MAINTAINER wkf

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

ADD ./config/nginx.conf /etc/nginx/sites-available/default

VOLUME ["/public"]

EXPOSE 80

CMD ["nginx"]
