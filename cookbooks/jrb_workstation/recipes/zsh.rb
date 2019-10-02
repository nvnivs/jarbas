#
# Cookbook:: jrb_workstation
# Recipe:: zsh
#
# Copyright:: 2019, The Authors, All Rights Reserved.

package 'zsh' do
  action :upgrade
end

git "#{node['jrb_workstation']['home']}/.oh-my-zsh" do
  repository 'https://github.com/robbyrussell/oh-my-zsh.git'
  action :checkout
  user node['jrb_workstation']['user']
  notifies :run, 'execute[set_default_shell]', :immediately
end

template "#{node['jrb_workstation']['home']}/.zshrc" do
  source 'zshrc.erb'
  owner node['jrb_workstation']['user']
  mode '0644'
end

execute 'set_default_shell' do
  command "chsh -s $(which zsh) #{node['jrb_workstation']['user']}"
  action :nothing
end
