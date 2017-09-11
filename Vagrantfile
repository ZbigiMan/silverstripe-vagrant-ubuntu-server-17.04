Vagrant.configure("2") do |config|  
  config.vm.box = "xenji/ubuntu-17.04-server"
  config.vm.box_version = "17.04.0" 
 
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.synced_folder ".", "/vagrant", :mount_options => ['dmode=777,fmode=666']

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.name = "ss-ubuntu-17.04-server"
  end

  config.vm.provision :shell, :path => "provision.sh"
  
end