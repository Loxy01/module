apt-get update
apt-get install docker-engine -y
apt-get install docker-compose -y
usermod user -aG docker
systemctl enable --now docker
mv /wiki.yml /home/user/
docker volume create dbvolume
docker compose -f wiki.yml up -d
docker ps -a
echo "HQ-CLI -> http://ip_br-srv:8080"
echo "HQ-CLI -> scp /home/user/Загрузки/LocalSettings.php user@IP_BR-SRV:/home/user/"
echo "delete #LocalSettings in wiki.yml and reboot"
