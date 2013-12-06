Vagrant.configure("2") do |config|
  config.vm.box      = 'precise64'
  config.vm.network    'forwarded_port', guest: 80, host: 8080, auto_correct: true
  config.vm.network    'forwarded_port', guest: 81, host: 8081, auto_correct: true

  config.berkshelf.enabled    = true
  config.omnibus.chef_version = :latest

  config.vm.provider :digital_ocean do |provider, override|
    override.ssh.private_key_path = '~/.ssh/id_rsa'
    override.vm.box = 'digital_ocean'
    override.vm.box_url = "https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box"

    provider.client_id = ENV['DIGITAL_OCEAN_CLIENT_ID']
    provider.api_key = ENV['DIGITAL_OCEAN_API_KEY']
    provider.private_networking = true
  end

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe 'docker'
  end

  config.vm.define :web_1 do |machine|
    machine.vm.hostname = "psdgrade-web-1"
    machine.vm.provision :shell, inline: <<-SHELL
      sudo docker build -t web /vagrant/web
      sudo docker stop web
      sudo docker rm web
      sudo docker run -d -v /vagrant/web/public:/public -p 80:80 -name web web
    SHELL
  end

  config.vm.define :app_1 do |machine|
    machine.vm.hostname = "psdgrade-app-1"
    machine.vm.provision :shell, inline: <<-SHELL
      sudo docker build -t app /vagrant/app
      sudo docker stop app
      sudo docker rm app
      sudo docker run -d -p 80:80 -name app app
    SHELL
  end

  config.vm.define :app_2 do |machine|
    machine.vm.hostname = "psdgrade-app-2"
    machine.vm.provision :shell, inline: <<-SHELL
      sudo docker build -t app /vagrant/app
      sudo docker stop app
      sudo docker rm app
      sudo docker run -d -p 80:80 -name app app
    SHELL
  end

  config.vm.define :app_3 do |machine|
    machine.vm.hostname = "psdgrade-app-3"
    machine.vm.provision :shell, inline: <<-SHELL
      sudo docker build -t app /vagrant/app
      sudo docker stop app
      sudo docker rm app
      sudo docker run -d -p 80:80 -name app app
    SHELL
  end

  config.vm.define :app_4 do |machine|
    machine.vm.hostname = "psdgrade-app-4"
    machine.vm.provision :shell, inline: <<-SHELL
      sudo docker build -t app /vagrant/app
      sudo docker stop app
      sudo docker rm app
      sudo docker run -d -p 80:80 -name app app
    SHELL
  end
end

