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
  command "brew cask install https://raw.githubusercontent.com/caskroom/homebrew-cask/#{node['jrb_workstation']['vagrant']['version_sha']}/Casks/vagrant.rb"
  not_if 'which vagrant'
  user node['jrb_workstation']['user']
  environment ({
    'HOME' => node['jrb_workstation']['home'],
    'USER' => node['jrb_workstation']['user'] })
  cwd node['jrb_workstation']['home']
end

node['jrb_workstation']['vagrant']['plugins'].each do |p|
  execute "install_vagrant_plugin[#{p}]" do
    command "vagrant plugin install #{p}"
    not_if "vagrant plugin list |grep #{p}"
  end
end
