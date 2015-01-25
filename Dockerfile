############################################################
# Dockerfile to build Plex Installed Containers
# Based on Fedora 21
############################################################

FROM		uhurunet/fedora21
MAINTAINER	Frederick Mbuya "freddie@uhurunet.com"
ENV PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR="/var/lib/plexmediaserver/Library/Application Support"
ENV PLEX_MEDIA_SERVER_HOME=/usr/lib/plexmediaserver
ENV PLEX_MEDIA_SERVER_MAX_PLUGIN_PROCS=6
ENV PLEX_MEDIA_SERVER_TMPDIR=/tmp
#ENV LC_ALL=en_US.UTF-8
RUN		yum -y update
ADD		plexaa /tmp/plexaa
ADD		plexab /tmp/plexab
ADD		plexac /tmp/plexac
RUN		cat /tmp/plexa* > /tmp/plexmediaserver-0.9.11.7.803-87d0708.x86_64.rpm
RUN		yum -y install /tmp/plexmediaserver-0.9.11.7.803-87d0708.x86_64.rpm
ADD             plex-ld.conf /etc/ld.so.conf.d/plex-ld.conf
RUN             /usr/sbin/ldconfig -v
RUN		mkdir -p "/var/lib/plexmediaserver/Library/Application Support"
ADD		Preferences.xml "/var/lib/plexmediaserver/Library/Application Support/Plex Media Server/Preferences.xml"
ADD 		supervisord.conf /etc/supervisord.conf
RUN		mkdir -p /uhurunet/tv_series
RUN		mkdir -p /uhurunet/movies
RUN		mkdir -p /uhurunet/documentaries
RUN		mkdir -p /uhurunet/music
 
EXPOSE 22 32400
#ENTRYPOINT ["/usr/bin/supervisord"] 
ENTRYPOINT ["/bin/bash"]
