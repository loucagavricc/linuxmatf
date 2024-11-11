#!/bin/bash

sudo exportfs -r
sudo /etc/init.d/nfs-kernel-server restart
sudo /etc/init.d/tftpd-hpa restart
