iptables -t mangle -F
rmmod xt_GTPU
insmod ./Bin/xt_GTPU.ko
/bin/cp -f ./Bin/libxt_GTPU.so /lib/xtables/
iptables -t mangle -A PREROUTING -d 10.10.10.1 -j GTPU --own-ip 192.168.0.98 --own-tun 100 --peer-ip 192.168.0.109 --peer-tun 101 --action add
iptables -t mangle -A PREROUTING -s 192.168.0.109 -d 192.168.0.98 -p udp --dport 2152 -j GTPU --action remove
