rm -f /etc/samba/smb.conf
rm -rf /var/lib/samba
rm -rf /var/cache/samba
mkdir -p /var/lib/samba/sysvol
samba-tool domain provision --realm=au-team.irpo --domain au-team --adminpass='P@ssw0rd' --dns-backend=BIND9_DLZ --server-role=dc
systemctl enable --now samba
systemctl enable --now bind
cp /var/lib/samba/private/krb5.conf /etc/krb5.conf
samba-tool domain info 127.0.0.1

samba-tool dns add hq-srv.au-team.irpo au-team.irpo hq-rtr A 192.168.100.1 -Uadministrator
samba-tool dns add hq-srv.au-team.irpo au-team.irpo hq-rtr A 192.168.200.1 -Uadministrator
samba-tool dns add hq-srv.au-team.irpo au-team.irpo hq-rtr A 192.168.99.1 -Uadministrator
samba-tool dns add hq-srv.au-team.irpo au-team.irpo br-rtr A 192.168.0.1 -Uadministrator
samba-tool dns add hq-srv.au-team.irpo au-team.irpo br-srv A 192.168.0.2 -Uadministrator
samba-tool dns add hq-srv.au-team.irpo au-team.irpo moodle A 172.16.4.1 -Uadministrator
samba-tool dns add hq-srv.au-team.irpo au-team.irpo wiki A 172.16.4.1 -Uadministrator

host wiki.au-team.irpo
host moodle.au-team.irpo
