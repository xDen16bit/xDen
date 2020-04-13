cp -f /tmp/sshd_config /etc/ssh/sshd_config
cp -f /tmp/time.conf /etc/security/time.conf
systemctl restart sshd.service 