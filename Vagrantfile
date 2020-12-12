# -*- mode: ruby -*-
# vi: set ft=ruby :

boxes = [
    {
        :name => "dns",
        :eth1 => "192.168.120.8",
        :eth2 => "192.168.120.2",
        :mem => "2048",
        :cpu => "2"
    },
    {
        :name => "dns-backup",
        :eth1 => "192.168.120.9",
        :eth3 => "192.168.120.3",
        :mem => "2048",
        :cpu => "2"
    },
    {
        :name => "internal-test",
        :eth1 => "192.168.120.100",
        :mem => "2048",
        :cpu => "2"
    },
    {
        :name => "webserver",
        :eth1 => "192.168.120.101",
        :mem => "2048",
        :cpu => "2"
    },
    {
        :name => "external-test",
        :eth1 => "192.168.121.10",
	:eth3 => "192.168.120.134",
        :mem => "2048",
        :cpu => "2"
    }
]

Vagrant.configure(2) do |config|

  config.vm.box = "bento/ubuntu-20.04"

  boxes.each do |opts|
    config.vm.define opts[:name] do |config|
      config.vm.hostname = opts[:name]

      # configure virtualbox
      config.vm.provider "virtualbox" do |v|
        v.customize ["modifyvm", :id, "--name", opts[:name]]
        v.customize ["modifyvm", :id, "--memory", opts[:mem]]
        v.customize ["modifyvm", :id, "--cpus", opts[:cpu]]
      end

      # run install script and copy startup script upon provision
      config.vm.provision :shell, inline: "/vagrant/scripts/install/" + opts[:name] + "_install.sh"
      config.vm.provision :shell, inline: "cp /vagrant/scripts/startup/" + opts[:name] + "_startup.sh ~/"

      # set ethernet port
      config.vm.network :private_network, ip: opts[:eth1], virtualbox__intnet: true
      if opts.key?(:eth2)
        config.vm.network :private_network, ip: opts[:eth2], virtualbox__intnet: true
      end
      if opts.key?(:eth3)
        config.vm.network :private_network, ip: opts[:eth3], auto_config:false, virtualbox__intnet: true
      end



    end
  end
end
