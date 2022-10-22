FROM centos:7
RUN yum install httpd -y
ENV myname=shaik liyakath
COPY index.html /var/www/html/
