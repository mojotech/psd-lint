FROM ubuntu
MAINTAINER wkf

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get -qq update
RUN apt-get -y upgrade

RUN apt-get -y install python-software-properties
RUN apt-add-repository ppa:brightbox/ruby-ng
RUN apt-get -qq update

RUN apt-get -y install ruby2.0 ruby2.0-dev rubygems ruby-switch
RUN ruby-switch --set ruby2.0

RUN gem install rake bundler --no-rdoc --no-ri

ADD . /app

RUN cd /app; bundle install

EXPOSE 80

WORKDIR /app

CMD ["rainbows", "-l", "0.0.0.0:80", "-c", "config/rainbows.rb"]
