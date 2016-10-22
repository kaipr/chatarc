Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.network "forwarded_port", guest: 3000, host: 4000

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", 1024]

    v.customize ["modifyvm", :id, "--cpus", 2]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
  end

  config.vm.provision :shell, path: "provision/guest_ansible.sh"
# Use this when using a reasonable developer system (not windows)
#  config.vm.provision :ansible do |ansible|
#    ansible.playbook = 'provision/ansible/site.yml'
#    ansible.verbose = 'v'
#  end
end
