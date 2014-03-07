#!/bin/bash

HOSTNAME=arthur
NFS_EXTERNAL_ADDR=62.210.195.11
NFS_GRE_ADDR=10.1.1.2
XENSERVER_GRE_ADDR=10.1.1.1
XENSERVER_SUBNET=10.13.1.0\\/24

sed -i "s/hostname/$HOSTNAME/g" deploy.sh
mv etc/openvpn/hostname.ovpn etc/openvpn/$HOSTNAME.ovpn
sed -i "s/addresse_externe_nfs/$NFS_EXTERNAL_ADDR/g" etc/sysconfig/network-scripts/ifcfg-tun1
sed -i "s/addresse_interne_gre_nfs/$NFS_GRE_ADDR/g" etc/sysconfig/network-scripts/ifcfg-tun1
sed -i "s/addresse_interne_gre_xenserver/$XENSERVER_GRE_ADDR/g" etc/sysconfig/network-scripts/ifcfg-tun1
sed -i "s/ip_nfs_via_gre/$NFS_GRE_ADDR/g" root/fix_route.sh
sed -i "s/sous_reseau_xenserver/$XENSERVER_SUBNET/g" root/fix_route.sh