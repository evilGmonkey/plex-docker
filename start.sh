#!/bin/bash
mount -a
sleep 10
export PATH=$PATH:/usr/lib/plexmediaserver/
cd /usr/lib/plexmediaserver/
/usr/lib/plexmediaserver/start.sh &
/bin/bash
#'/usr/lib/plexmediaserver/Plex\ Media\ Server'

