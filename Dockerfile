FROM centos:7
RUN yum install httpd -y
OPY index.html /var/www/html/

