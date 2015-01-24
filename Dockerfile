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
ENV LD_LIBRARY_PATH=/usr/lib/plexmediaserver
ENV LC_ALL=en_US.UTF-8
RUN		yum -y update
ADD		plexaa /tmp/plexaa
ADD		plexab /tmp/plexab
ADD		plexac /tmp/plexac
RUN		cat /tmp/plexa* > /tmp/plexmediaserver-0.9.11.7.803-87d0708.x86_64.rpm
RUN		yum -y install /tmp/plexmediaserver-0.9.11.7.803-87d0708.x86_64.rpm
ADD 		supervisord.conf /etc/supervisord.conf
 
EXPOSE 22 32400
#ENTRYPOINT ["/usr/bin/supervisord"] 
ENTRYPOINT ["/bin/bash"]
