#!/bin/sh

# Create User
pw useradd -n tautulli -c "Tautulli" -s /sbin/nologin -w no

# Install
fetch https://github.com/Tautulli/Tautulli/archive/master.tar.gz
tar xfz master.tar.gz -C /usr/local/share/
mv /usr/local/share/Tautulli-master /usr/local/share/tautulli

chown -R tautulli:tautulli /usr/local/share/tautulli

# Copy init script
cp /usr/local/share/tautulli/init-scripts/init.freenas /usr/local/etc/rc.d/tautulli

# Configure/enable daemon
sysrc -f /etc/rc.conf tautulli_user="tautulli"
sysrc -f /etc/rc.conf tautulli_enable="YES"

# Start service
service tautulli start
