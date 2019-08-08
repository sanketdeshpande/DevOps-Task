
FROM centos:7

RUN yum -y update && yum clean all && yum -y install wget && yum -y install tar && yum -y install https://centos7.iuscommunity.org/ius-release.rpm && yum -y install python36u && yum install httpd httpd-tools -y
RUN echo 'alias python="/usr/bin/python3.6"' >> ~/.bashrc

# Set up mongodb yum repo entry
# https://www.liquidweb.com/kb/how-to-install-mongodb-on-centos-6/
RUN echo -e "\
[mongodb]\n\
name=MongoDB Repository\n\
baseurl=https://repo.mongodb.org/yum/redhat/7Server/mongodb-org/3.0/x86_64/\n\
gpgcheck=0\n\
enabled=1\n" >> /etc/yum.repos.d/mongodb.repo

# Install mongodb
RUN yum update -y && yum install -y mongodb-org

# Set up directory requirements
RUN mkdir -p /data/mongodb /var/log/mongodb /var/run/mongodb
VOLUME ["/data/mongodb", "/var/log/mongodb"]

# Expose port 27017 from the container to the host
EXPOSE 27017

CMD ["--port", "27017", "--dbpath", "/data/mongodb", "--pidfilepath", "/var/run/mongodb/mongod.pid"]
#--------------------------------------------------------------------------------------------------------------

RUN yum -y install epel-release && yum -y install java-1.8.0-openjdk.x86_64
RUN wget http://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.43/src/apache-tomcat-8.5.43-src.tar.gz
RUN mkdir /opt/tomcat && tar -zxvf apache-tomcat-8*-src.tar.gz -C /opt/tomcat --strip-components=1

RUN groupadd tomcat &&  useradd -s /bin/nologin -g tomcat -d /opt/tomcat tomcat

RUN cd /opt/tomcat && \
chgrp -R tomcat conf && \
chmod g+rwx conf && \
chmod g+r conf/* && \
chown -R tomcat webapps/ && \
chgrp -R tomcat bin && \
chmod g+rwx bin && \
chmod g+r bin/*

EXPOSE 8080
CMD [systemctl restart tomcat.service]

#to Build image use: docker build -t tweleve .

#to run the conainer use:
# docker run -it -d -p 8080:7080 tweleve