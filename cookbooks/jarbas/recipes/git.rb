#
# Cookbook:: jarbas
# Recipe:: git
#
# Copyright:: 2020, The Authors, All Rights Reserved.

jarbas_package 'git'

#TODO: git cookbook does not support Manjaro
#TODO: Add guards
jarbas_execute 'git_config[user.name]' do
  command "git config --global user.name '#{node['jarbas']['git']['user']['name']}'"
end

jarbas_execute 'git_config[user.email]' do
  command "git config --global user.email '#{node['jarbas']['git']['user']['email']}'"
end
