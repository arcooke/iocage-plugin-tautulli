#!/bin/sh

# Create user
pw useradd -n tautulli -c "Tautulli" -s /sbin/nologin -w no

# Install
cd /usr/local/share
git clone --depth=1 https://github.com/Tautulli/Tautulli.git
chown -R tautulli:tautulli Tautulli

# Copy init script
mkdir /usr/local/etc/rc.d
cp /usr/local/share/Tautulli/init-scripts/init.freenas /usr/local/etc/rc.d/tautulli

# Configure/enable daemon
sysrc -f /etc/rc.conf tautulli_user="tautulli"
sysrc -f /etc/rc.conf tautulli_enable="YES"

# Start service
service tautulli start
