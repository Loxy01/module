apt-get update
apt-get install mdadm -y
apt-get update
apt-get install nfs-server -y
mdadm --create --verbose /dev/md0 -l 1 -n 3 /dev/sd{b,c,d}
echo "DEVICE partitions" > /etc/mdadm.conf
mdadm --detail --scan --verbose | awk '/ARRAY/ {print}' >> /etc/mdadm.conf
mkfs.ext4 /dev/md0
mkdir /raid1
mkdir /raid1/nfs
chmod 777 /raid1/nfs
mount /dev/md0 /raid1
df -h
blkid | grep md0
blkid | grep md0 >> /etc/fstab
echo "dalee unmount /raid1/mount -a/df -h/reboot"
vim /etc/fstab
