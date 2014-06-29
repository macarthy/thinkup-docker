# DOCKER-VERSION 1.0.1
FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive


# update apt-get
RUN apt-get update

# install utils 
RUN apt-get install wget unzip -y 

# install php and required modules 
RUN apt-get install php5 -y 
RUN apt-get install php5-curl -y 
RUN apt-get install php5-gd -y 

# install mysql 

# setup up mysql
# very useful info here on mysql and docker
# http://txt.fliglio.com/2013/11/creating-a-mysql-docker-container/
# create db and user

#RUN echo "mysql-server mysql-server/root_password password testing" | debconf-set-selections
#RUN echo "mysql-server mysql-server/root_password_again password testing" | debconf-set-selections
                                                       
RUN apt-get install mysql-server php5-mysql -y 

RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

RUN /usr/sbin/mysqld & \
    sleep 10s &&\
    echo "GRANT ALL ON *.* TO admin@'%' IDENTIFIED BY 'changeme' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql
            

# Expose the PostgreSQL port
EXPOSE 3306


# setup acpahce 
RUN apt-get install apache2 -y 

# install thinkup
# get thinkup 
#RUN wget http://thinkup.com/download/ --output-document thinkup.zip
#RUN unzip thinkup.zip


CMD ["/usr/bin/mysqld_safe"]

