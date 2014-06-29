# DOCKER-VERSION 1.0.1
FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive


# update apt-get
RUN apt-get update

# install utils 
RUN apt-get install wget -y 

# install php and required modules 
RUN apt-get install php5 -y 
RUN apt-get install php5-curl -y 
RUN apt-get install php5-gd -y 

# install mysql 
RUN apt-get install mysql-server php5-mysql -y 

#setup up mysql
# create db and user

# setup acpahce 
RUN apt-get install apache2 -y 

# install thinkup
# get thinkup 
RUN wget http://thinkup.com/download/ --output-document thinkup.zip
RUN unzip thinkup.zip



