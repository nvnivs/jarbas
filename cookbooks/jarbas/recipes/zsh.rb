#
# Cookbook:: jarbas
# Recipe:: zsh
#
# Copyright:: 2019, The Authors, All Rights Reserved.

package 'zsh' do
  action :upgrade
end

git "#{node['jarbas']['home']}/.oh-my-zsh" do
  repository 'https://github.com/robbyrussell/oh-my-zsh.git'
  action     :checkout
  user       node['jarbas']['user']
  notifies   :run, 'execute[set_default_shell]', :immediately
end

template "#{node['jarbas']['home']}/.zshrc" do
  source 'zshrc.erb'
  owner  node['jarbas']['user']
  mode   '0644'
end

execute 'set_default_shell' do
  command "chsh -s $(which zsh) #{node['jarbas']['user']}"
  action  :nothing
end

remote_directory "#{node['jarbas']['home']}/.zsh_custom" do
  source      'zsh_custom'
  owner       node['jarbas']['user']
  files_mode  '0744'
  files_owner node['jarbas']['user']
end
