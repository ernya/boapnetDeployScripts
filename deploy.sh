#!/bin/bash

mv /sbin/iptables /sbin/iptables_real
echo '#!/bin/bash
true' > /sbin/iptables
wget http://download.cloud.com.s3.amazonaws.com/tools/vhd-util
cp vhd-util /opt/xensource/bin/
cp vhd-util /opt/cloud/bin/
cp -R etc /
cp -R root /
echo 'openvpn /etc/openvpn/hostname.ovpn > /var/log/ovpn-hostname.log &> /var/log/ovpn-hostname.error &' >> /etc/rc.local
echo '/root/fix_route.sh &' >> /etc/rc.local
