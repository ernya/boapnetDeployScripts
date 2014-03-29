#!/bin/bash

HOSTNAME=arthur
NFS_EXTERNAL_ADDR=62.210.195.11
NFS_GRE_ADDR=10.1.1.2
NFS_OPENVPN_ADDR=10.13.42.1
XENSERVER_GRE_ADDR=10.1.1.1
XENSERVER_SUBNET=10.13.1.0\\/24
XENSERVER_GATEWAY=62.210.172.1
XENSERVER_DNS=62.210.16.6
XENSERVER_OPENVPN_GATEWAY=10.13.1.1
XENSERVER_OPENVPN_IP=10.13.1.2
XENSERVER_OPENVPN_NETMASK=255.255.255.0
ETH1_UUID=c3280f59-933d-2cd1-00dd-8c30d19f6f6b #Can be accessed using xe pif-list params=all

sed -i "s/hostname/$HOSTNAME/g" deploy.sh
sed -i "s/DNS_XEN/$XENSERVER_DNS/g" deploy.sh
sed -i "s/GATEWAY_XEN/$XENSERVER_OPENVPN_GATEWAY/g" deploy.sh
sed -i "s/IP_XEN/$XENSERVER_OPENVPN_IP/g" deploy.sh
sed -i "s/NETMASK_XEN/$XENSERVER_OPENVPN_NETMASK/g" deploy.sh
sed -i "s/UUID_ETH1/$ETH1_UUID/g" deploy.sh
mv etc/openvpn/hostname.ovpn etc/openvpn/$HOSTNAME.ovpn
sed -i "s/addresse_externe_nfs/$NFS_EXTERNAL_ADDR/g" etc/sysconfig/network-scripts/ifcfg-tun1
sed -i "s/addresse_interne_gre_nfs/$NFS_GRE_ADDR/g" etc/sysconfig/network-scripts/ifcfg-tun1
sed -i "s/addresse_interne_gre_xenserver/$XENSERVER_GRE_ADDR/g" etc/sysconfig/network-scripts/ifcfg-tun1
sed -i "s/ip_nfs_via_gre/$NFS_GRE_ADDR/g" root/fix_route.sh
sed -i "s/sous-reseau_xenserver/$XENSERVER_SUBNET/g" root/fix_route.sh
sed -i "s/ip_nfs_openvpn/$NFS_OPENVPN_ADDR/g" root/fix_route.sh
sed -i "s/xenserver_gateway/$XENSERVER_GATEWAY/g" root/fix_route.sh