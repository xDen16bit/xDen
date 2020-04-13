yum install -y udisks2
cp -f /tmp/15-udisk2.rules /etc/polkit-1/rules.d/15-udisk2.rules
fdisk /dev/sdb << EOF
n
p
1


w
EOF
mkfs.ext4 -L datapartition /dev/sdb1
