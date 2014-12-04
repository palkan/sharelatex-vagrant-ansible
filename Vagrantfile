Vagrant.configure("2") do |config|

  config.vm.box       = "precise64"
  config.vm.box_url   = "http://files.vagrantup.com/precise64.box"

  config.vm.provider "virtualbox" do |v|
  	# system tuning
    # v.memory = 1024
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "priv/ansible/share_latex.yml"
    ansible.inventory_path = "priv/ansible/dev_hosts"
    ansible.tags = ENV["TAGS"]
    ansible.skip_tags = ENV["SKIP_TAGS"]
  end

  config.vm.network :forwarded_port, host: 2211, guest: 22 
  config.vm.network "forwarded_port", guest: 3000, host: 3002
  config.vm.network "private_network", ip: "192.168.51.111"

  config.vm.synced_folder ".", "/vagrant", :disabled => true
  config.vm.synced_folder "src/", "/webapps/sharelatex", create: true, id: "vagrant-root",
    owner: "vagrant",
    group: "www-data",
    mount_options: ["dmode=775,fmode=764"]

end