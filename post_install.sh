#!/bin/sh

# Create User
pw useradd -n tautulli -c "Tautulli" -s /sbin/nologin -w no

# Install from master
cd /usr/local/share
git clone https://github.com/Tautulli/Tautulli.git
chown -R tautulli:tautulli Tautulli

# Copy init script
cp /usr/local/share/Tautulli/init-scripts/init.freenas /usr/local/etc/rc.d/tautulli

# Configure/enable daemon
sysrc -f /etc/rc.conf tautulli_user="YES"
sysrc -f /etc/rc.conf tautulli_enable="YES"

# Cleanup
pkg delete -y git
pw userdel git_daemon

# Start service
service tautulli start
