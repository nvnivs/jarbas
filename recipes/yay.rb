#
# Cookbook:: jarbas
# Recipe:: yay
#
# Copyright:: 2022, The Authors, All Rights Reserved.

directory '/var/cache/yay' do
  owner 'root'
  group 'root'
  mode  '0777'
end

jarbas_package 'yay'
