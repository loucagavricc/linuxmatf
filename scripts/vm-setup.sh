#!/bin/bash

cd ~
rm -rf linuxmatf
sudo rm -rf nfsroot
sudo apt update -y
sudo apt install -y tftpd-hpa
sudo apt install -y nfs-kernel-server
sudo apt install -y picocom
nmcli con add type ethernet ifname enxf8dc7a000001 ip4 192.168.0.1/24
sudo -i <<EOF
echo "/home/ubuntu/nfsroot 192.168.0.100(rw,no_root_squash,no_subtree_check)" > /etc/exports
EOF
sudo apt install -y git
sudo apt install -y git-lfs
git clone https://github.com/loucagavricc/linuxmatf.git
cd linuxmatf
sudo cp -rL scripts ~/helper-scripts
sudo unzip nfsroot.zip -d ~
sudo cp zimage-dtb/zImage /srv/tftp
sudo cp zimage-dtb/am335x-boneblack.dtb /srv/tftp
sudo exportfs -r
sudo /etc/init.d/nfs-kernel-server restart
sudo /etc/init.d/tftpd-hpa restart
rm -rf ~/linuxmatf
