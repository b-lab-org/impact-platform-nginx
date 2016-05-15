FROM debian:jessie
MAINTAINER "The Impact Bot" <technology@bcorporation.net>

RUN apt-get update -y && \
    apt-get install -y software-properties-common && \
    apt-get update && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/* && \
    echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
    chown -R www-data:www-data /var/lib/nginx

RUN rm -rf /etc/apt/sources.list.d/proposed.list

RUN apt-get update && \
  apt-get install -y \
  curl \
  wget \
  sudo

ADD nginx.conf /opt/etc/nginx.conf

RUN mkdir -p /etc/nginx && \
    mkdir -p /etc/nginx/sites-enabled && \
    mkdir -p /var/log/nginx && \
    mkdir -p /var/ssl

RUN rm -rf /etc/nginx/sites-enabled/default

ADD start.sh /opt/bin/start.sh
RUN chmod u=rwx /opt/bin/start.sh

VOLUME ["/etc/nginx/sites-enabled"]

EXPOSE 80
EXPOSE 443

WORKDIR /opt/bin

ENTRYPOINT ["/opt/bin/start.sh"]
