Vagrant.configure("2") do |config|
 config.vm.define "centos" do |subconfig|    
  subconfig.vm.box = "centos/7"
  subconfig.vm.hostname="centos"    
  subconfig.vm.network :private_network, ip: "192.168.55.11"    
  subconfig.vm.provider "virtualbox" do |vb|      
    vb.memory = "256"      
    vb.cpus = "1"    
    unless File.exist?('./sata1.vdi')
      vb.customize ['createhd', '--filename', './sata1.vdi', '--size', 500 * 1024]
    end  
    vb.customize ["storagectl", :id, "--name", "SATA", "--add", "sata" ]
    vb.customize ['storageattach', :id, '--storagectl', 'SATA', '--port', 1, '--device', 0, '--type', 'hdd', '--medium',  './sata1.vdi']
  end
#копируем скрипны и конфиги 
  subconfig.vm.provision "file", source: "./part1.sh", destination: "/tmp/"
  subconfig.vm.provision "file", source: "./part2.sh", destination: "/tmp/"
  subconfig.vm.provision "file", source: "./part3.sh", destination: "/tmp/"
  subconfig.vm.provision "file", source: "./15-udisk2.rules", destination: "/tmp/"
  subconfig.vm.provision "file", source: "./sshd_config", destination: "/tmp/"
  subconfig.vm.provision "file", source: "./sshd", destination: "/tmp/"
  subconfig.vm.provision "file", source: "./time.conf", destination: "/tmp/"
  subconfig.vm.provision "shell", inline:"useradd otus"
  subconfig.vm.provision "shell", inline:"useradd otus2"
  subconfig.vm.provision "shell", inline:"useradd otus3"
  subconfig.vm.provision "shell", inline:"cp -r /home/vagrant/.ssh /home/otus/.ssh"
  subconfig.vm.provision "shell", inline:"chown otus:otus -R /home/otus/.ssh"
  subconfig.vm.provision "shell", path: "/vagrant/" "part1.sh"; 
  subconfig.vm.provision "shell", path: "/vagrant/" "part2.sh"; 
  subconfig.vm.provision "shell", path: "/vagrant/" "part3.sh";   
 end

 config.vm.define "ubuntu" do |subconfig|
  subconfig.vm.box = "ubuntu/bionic64"
  subconfig.vm.hostname="ubuntu"
  subconfig.vm.network :private_network, ip: "192.168.55.12"
##Проверить недоступность сайта. Запрет через apparrmor. Смотреть  sudo cat /var/log/nginx/error.log
  subconfig.vm.network "forwarded_port", guest: 80, host: 80
  subconfig.vm.provider "virtualbox" do |vb|
    vb.memory = "256"
    vb.cpus = "1"
  end
#копируем скрипны и конфиги 
  subconfig.vm.provision "file", source: "./part4.sh", destination: "/tmp/"
  subconfig.vm.provision "file", source: "./usr.sbin.nginx", destination: "/tmp/"
  subconfig.vm.provision "file", source: "./nginx.conf", destination: "/tmp/"
  subconfig.vm.provision "shell", path: "/vagrant/" "part4.sh"
 end
end