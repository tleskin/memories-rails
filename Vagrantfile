# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'hashicorp/precise64'

  config.vm.network :private_network, ip: '10.10.10.10'

  # make the Rails server accessible
  config.vm.network 'forwarded_port', guest: 3000, host: 3000

  config.vm.synced_folder '.', '/vagrant', type: 'nfs'

  config.vm.provider 'virtualbox' do |vb|
    vb.customize ['modifyvm', :id, '--memory', '1536']
  end

  config.vm.provision 'shell', path: 'https://raw.github.com/notabli/VagrantDevEnv/master/scripts/base.sh'
  config.vm.provision 'shell', path: 'https://raw.githubusercontent.com/notabli/VagrantDevEnv/master/scripts/ruby-2.1.5.sh', privileged: false, keep_color: true
  config.vm.provision 'shell', path: 'https://raw.github.com/notabli/VagrantDevEnv/master/scripts/postgresql93.sh'

  config.vm.provision :shell, inline: "cp /vagrant/config/database.yml{.vagrant,}"
end
