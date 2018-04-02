FROM centos:7

RUN yum update -y && \
    yum install -y epel-release

RUN yum install -y nginx

RUN yum clean all

CMD nginx
