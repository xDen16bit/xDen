# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|
  config.vm.box_check_update = false
  #VirtualBox1
  config.vm.define "attack" do |atk|
	atk.vm.box = "kalilinux/rolling"
	atk.vm.hostname = "attack-kali"
	atk.vm.provider "virtualbox" do |vb|
	 vb.name="kali_lab_1"
	 vb.cpus="2"
	 vb.memory = "2048"
	 vb.gui = false
	end	
  end
  #VirtualBox2 
  config.vm.define "guard" do |grd|
	grd.vm.box = "centos/7"
	grd.vm.hostname = "defence-centos"
    grd.vm.network "forwarded_port", guest: 80, host: 8080
    grd.vm.provider "virtualbox" do |vb|
     vb.name="centos_lab_1"
	 vb.cpus="2"
     vb.memory = "2048"
	 vb.gui = false
	end
  end
  
 end
