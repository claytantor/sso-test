# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "peru/ubuntu-18.04-desktop-amd64"
  config.vm.box_version = "20200601.01"
  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.synced_folder "spapp/", "/spapp"
    
  config.vm.provision "docker" do |d|
    d.build_image "/spapp", args: "-t sso-test/sp-node"
    d.run "kristophjunge/test-saml-idp", args: "--name=testsamlidp -p 8080:8080 -p 8443:8443 -e SIMPLESAMLPHP_SP_ENTITY_ID=saml-poc -e SIMPLESAMLPHP_SP_ASSERTION_CONSUMER_SERVICE=http://localhost:4300/login/callback"
    d.run "sso-test/sp-node", args: "-p 4300:4300"
  end


end
