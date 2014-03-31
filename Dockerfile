FROM nikicat/ubuntu-ut

ADD exim.debconf /root/
RUN debconf-set-selections < /root/exim.debconf && DEBIAN_FRONTEND=noninteractive apt-get install -y exim4
# HACK: due to strage bug Debian-exim could not create log files
#RUN gpasswd -a Debian-exim root

EXPOSE 25
CMD ["/usr/sbin/exim4", "-bdf", "-v", "-q30m"]

