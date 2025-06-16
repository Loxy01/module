#br-srv
apt-get update && apt-get install ansible sshpass
echo "vim /etc/ansible/ansible.cfg"
echo "inventory	= /etc/ansible/hosts"
echo "interpreter_python=/usr/bin/python3"
echo "host_key_checking = False"

echo "192.168.100.2 ansible_user=sshuser ansible_password=P@ssw0rd ansible_port=2024" >> /etc/ansible/hosts
echo "192.168.200.2 ansible_user=user ansible_password=resu ansible_port=22" >> /etc/ansible/hosts
echo "192.168.0.1 ansible_user=net_admin ansible_password=P@$$word ansible_port=22" >> /etc/ansible/hosts
echo "192.168.0.2 ansible_user=sshuser ansible_password=P@ssw0rd ansible_port=2024" >> /etc/ansible/hosts

echo "ansible all -m ping"
echo "na hq-cli systemctl enable --now sshd"
