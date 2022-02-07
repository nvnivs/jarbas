#
# Cookbook:: jarbas
# Recipe:: yay
#
# Copyright:: 2022, The Authors, All Rights Reserved.

jarbas_package 'yay'

=begin

# Build from source fails with the following error

STDERR: ==> ERROR: Running makepkg as root is not allowed as it can cause permanent,
catastrophic damage to your system.
---- End output of makepkg -si ----
Ran makepkg -si returned 10

include_recipe 'jarbas::git'

directory "#{node['jarbas']['repos']}" do
  owner node['jarbas']['user']
  mode  '0755'
end

git "#{node['jarbas']['repos']}/pfetch" do
  repository  'https://github.com/Jguer/yay.git'
  action      :checkout
  user        node['jarbas']['user']
  notifies    :run, 'jarbas_execute[build_yay]', :immediately
end

jarbas_execute 'build_yay' do
  command 'makepkg -si'
  cwd     node['jarbas']['repos']
  action  :nothing
end
=end
