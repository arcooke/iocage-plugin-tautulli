#!/bin/sh

# Create User
#pw useradd -n tautulli -c "Tautulli" -s /sbin/nologin -w no

# Install
fetch https://github.com/Tautulli/Tautulli/archive/master.tar.gz
tar xfz master.tar.gz -C /usr/local/share/
mv /usr/local/share/Tautulli-master /usr/local/share/Tautulli

chmod -R 777 /usr/local/share/Tautulli
#chown -R tautulli:tautulli /usr/local/share/Tautulli

# Copy init script
mkdir /usr/local/etc/rc.d
cp /usr/local/share/Tautulli/init-scripts/init.freenas /usr/local/etc/rc.d/tautulli

# Configure/enable daemon
sysrc -f /etc/rc.conf tautulli_user="root"
sysrc -f /etc/rc.conf tautulli_enable="YES"

# Start service
service tautulli start
