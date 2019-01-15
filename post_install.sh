#!/bin/sh

# Install
cd /usr/local/share
git clone --depth=1 https://github.com/Tautulli/Tautulli.git
chmod -R 777 Tautulli

# Copy init script
mkdir /usr/local/etc/rc.d
cp /usr/local/share/Tautulli/init-scripts/init.freenas /usr/local/etc/rc.d/tautulli

# Configure/enable daemon
sysrc -f /etc/rc.conf tautulli_user="root"
sysrc -f /etc/rc.conf tautulli_enable="YES"

# Start service
service tautulli start
