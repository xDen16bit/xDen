sudo apt-get update
sudo apt-get install -y apparmor-profiles
sudo apt-get install -y nginx
sudo apt-get install -y apparmor-utils
cp -f /tmp/usr.sbin.nginx /etc/apparmor.d/usr.sbin.nginx
sudo aa-enforce nginx
sudo /etc/init.d/apparmor reload
sudo service nginx restart
