#!/bin/bash

sudo apt purge -y tftpd-hpa
sudo apt purge -y nfs-kernel-server
sudo apt purge -y picocom
nmcli con del ethernet-enxf8dc7a000001
sudo -i <<EOF
sudo echo "" > /etc/exports
EOF

