# DOCKER-VERSION 1.0.1
FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive


RUN apt-get update
RUN apt-get install php5 -y 
RUN apt-get install php5-curl -y 
RUN apt-get install php5-gd -y 
RUN apt-get install mysql-server php5-mysql -y 
RUN apt-get install apache2 -y 
RUN apt-get install wget -y 
RUN wget http://thinkup.com/download/thinkup-2.0-beta.10.zip --output-document thinkup.zip
RUN unzip thinkup.zip


