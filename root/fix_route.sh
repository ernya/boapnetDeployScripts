#!/bin/bash
sleep 60
ip route del default
ip route add default via 62.210.172.1 dev xenbr0
ifup tun1
ip route add 10.13.42.1 via ip_nfs_via_gre
iptables_real -F
iptables_real -F INPUT
iptables_real -F OUTPUT
iptables_real -F FORWARD
iptables_real -t nat -A POSTROUTING -j MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward
ip route del sous-reseau_xenserver dev tap0
