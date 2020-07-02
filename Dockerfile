FROM centos:7
MAINTAINER Matteo Cerutti <matteo.cerutti@hotmail.co.uk>

RUN yum clean all &&                   \
    yum install -y epel-release &&     \
    yum install -y python3-pip         \
                   supervisor          \
                   nginx               \
                   unzip               \
                   uwsgi               \
                   uwsgi-plugin-python \
    && rm -rf /var/cache/yum/*

RUN curl -LO https://github.com/voxpupuli/puppetboard/archive/master.zip && \
    unzip master.zip && \
    rm master.zip && \
    mv puppetboard-master /app

COPY files/supervisor.ini /etc/supervisord.d/puppetboard.ini
COPY files/settings.py /etc/puppetboard/
COPY files/wsgi.py /app/
COPY files/wsgi.ini /app/
COPY files/nginx.conf /etc/nginx/

WORKDIR /app

RUN pip3 install -r requirements-docker.txt

EXPOSE 8000

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
