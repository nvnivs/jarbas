#
# Cookbook:: jarbas
# Recipe:: git
#
# Copyright:: 2020, The Authors, All Rights Reserved.

#TODO: Package resource does not support Manjaro provider
package 'git' do
  not_if { node['platform'] == 'manjaro' }
end

pacman_package 'git' do
  only_if { node['platform'] == 'manjaro' }
end

#TODO: git cookbook does not support Manjaro
#TODO: Add guards
jarbas_execute 'git_config[user.name]' do
  command "git config --global user.name '#{node['jarbas']['git']['user']['name']}'"
end

jarbas_execute 'git_config[user.email]' do
  command "git config --global user.email '#{node['jarbas']['git']['user']['email']}'"
end
