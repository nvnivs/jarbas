#
# Cookbook:: jrb_workstation
# Recipe:: vagrant
#
# Copyright:: 2019, The Authors, All Rights Reserved.

# Homebrew is failing with URL
#homebrew_cask 'vagrant' do
#  cask_name 'https://raw.githubusercontent.com/caskroom/homebrew-cask/687a8a9145b055886413ed8edbb5632ee0830c8e/Casks/vagrant.rb'
#end

# Vagrant is failing on the version 2.2.5 due to issues with the plugins and the version of ruby
execute 'install_vagrant' do
  command 'brew cask install https://raw.githubusercontent.com/caskroom/homebrew-cask/687a8a9145b055886413ed8edbb5632ee0830c8e/Casks/vagrant.rb'
  not_if 'which vagrant'
  user Homebrew.owner
  environment ({ 'HOME' => ::Dir.home(Homebrew.owner), 'USER' => Homebrew.owner })
  cwd ::Dir.home(Homebrew.owner)
end

plugins = [
  'vagrant-berkshelf',
  'vagrant-omnibus',
  'vagrant-vbguest'
]

plugins.each do |p|
  execute "install_vagrant_plugin[#{p}]" do
    command "vagrant plugin install #{p}"
    not_if "vagrant plugin list |grep #{p}"
  end
end
