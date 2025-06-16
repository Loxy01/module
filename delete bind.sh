apt-get update
apt-get install task-samba-dc -y
apt-get update
apt-get install bind bind-utils -y
control bind-chroot disabled
grep -q KRB5RCACHETYPE /etc/sysconfig/bind || echo 'KRB5RCACHETYPE="none"' >> /etc/sysconfig/bind
grep -q 'bind-dns' /etc/bind/named.conf || echo 'include "/var/lib/samba/bind-dns/named.conf";' >> /etc/bind/named.conf
echo "V file /etc/bind/options.conf -> forward first -> forwarders { 77.88.8.8; }"
echo "vpisat tkey-gssapi-keytab "/var/lib/samba/bind-dns/dns.keytab"; u minimal-responses yes;"
echo "listen any, allow any/logging -> category lame-servers {null;};"
systemctl stop bind
