#!/bin/bash

/sbin/ip route add 10.13.42.0/24 dev tap0
/sbin/ip route add 10.13.37.0/24 dev tap0
/sbin/ip route add 10.13.0.0/24 dev tap0 
/sbin/ip route add 10.13.10.0/24 dev tap0