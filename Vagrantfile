# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.5.0"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "server" do |server|
    server.vm.box = "chef/centos-7.0"
    server.vm.hostname = "kt-oracle"
    server.vm.network :private_network, ip: "192.168.40.10"
    server.omnibus.chef_version = :latest
    server.berkshelf.enabled = true
    server.vm.provision "chef_client" do |chef|
    	chef.chef_server_url = "https://tmsdevchf01.dub.usoh.ibm.com/organizations/kewill"
    	chef.validation_key_path = "/Users/IBM_ADMIN/chef-repo/.chef/kewill-validator.pem"
		chef.validation_client_name = "kewill-validator"
		chef.add_recipe "kt-init::default"
		chef.add_recipe "kt-oracle::default"
		chef.delete_node = true
		chef.delete_client = true
  	end
  end
  
end
