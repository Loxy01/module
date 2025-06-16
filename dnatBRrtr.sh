iptables -t nat -A PREROUTING -i enp6s18 -p tcp --dport 80 -j DNAT --to-destination 192.168.0.2:8080
iptables -t nat -A PREROUTING -i enp6s18 -p tcp --dport 2024 -j DNAT --to-destination 192.168.0.2
iptables-save > /etc/sysconfig/iptables
systemctl restart iptables
