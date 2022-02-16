#
# Cookbook:: jarbas
# Recipe:: bash
#
# Copyright:: 2019, The Authors, All Rights Reserved.

file "#{node['jarbas']['home']}/.profile" do
  content ''
  owner node['jarbas']['user']
  mode '644'
end

cookbook_file "#{node['jarbas']['home']}/.bash_profile" do
  source 'bash_profile'
  owner node['jarbas']['user']
  mode '644'
end
