FROM yandex/ubuntu

ADD exim.debconf /root/
RUN debconf-set-selections < /root/exim.debconf && DEBIAN_FRONTEND=noninteractive apt-get install -y exim4

EXPOSE 25
CMD ["/usr/sbin/exim4", "-bdf", "-v", "-q30m"]

