#
# Cookbook:: jrb_workstation
# Recipe:: bash_profile
#
# Copyright:: 2019, The Authors, All Rights Reserved.

file "#{node['jrb_workstation']['home']}/.profile" do
  content ''
  owner node['jrb_workstation']['user']
  mode '644'
end

cookbook_file "#{node['jrb_workstation']['home']}/.bash_profile" do
  source 'bash_profile'
  owner node['jrb_workstation']['user']
  mode '644'
end
