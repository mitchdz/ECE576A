# -*- mode: ruby -*-
# vi: set ft=ruby :

boxes = [
    {
        :name => "dns",
        :eth1 => "192.168.120.2",
        :mem => "2048",
        :cpu => "2"
    },
    {
        :name => "dev",
        :eth1 => "192.168.120.4",
        :mem => "2048",
        :cpu => "2"
    },
    {
        :name => "webserver",
        :eth1 => "192.168.120.4",
        :mem => "2048",
        :cpu => "2"
    },
    {
        :name => "outside",
        :eth1 => "192.168.121.2",
        :mem => "2048",
        :cpu => "2"
    }
]

Vagrant.configure(2) do |config|

  config.vm.box = "bento/ubuntu-20.04"

  # Turn off shared folders
  config.vm.synced_folder ".", "/vagrant", id: "vagrant-root", disabled: true

  boxes.each do |opts|
    config.vm.define opts[:name] do |config|
      config.vm.hostname = opts[:name]

      config.vm.provider "vmware_fusion" do |v|
        v.vmx["memsize"] = opts[:mem]
        v.vmx["numvcpus"] = opts[:cpu]
      end

      config.vm.provider "virtualbox" do |v|
        v.customize ["modifyvm", :id, "--name", opts[:name]]
        v.customize ["modifyvm", :id, "--memory", opts[:mem]]
        v.customize ["modifyvm", :id, "--cpus", opts[:cpu]]
      end

      config.vm.synced_folder ".", "/vagrant", disabled: false
      config.vm.provision :shell, inline: "/vagrant/scripts/startup/" + opts[:name] + "_startup.sh"

      config.vm.network :private_network, ip: opts[:eth1]
    end
  end
end
