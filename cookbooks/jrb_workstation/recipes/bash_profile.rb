#
# Cookbook:: jrb_workstation
# Recipe:: bash_profile
#
# Copyright:: 2019, The Authors, All Rights Reserved.

file "#{node['jrb_workstation']['home']}/.profile" do
  content ''
  owner node['jrb_workstation']['user']
  mode 0644
end

directory "#{node['jrb_workstation']['home']}/bin" do
  owner node['jrb_workstation']['user']
  mode 0755
end

directory "#{node['jrb_workstation']['home']}/.alias" do
  owner node['jrb_workstation']['user']
  mode 0755
end

cookbook_file "#{node['jrb_workstation']['home']}/.bash_profile" do
  source 'bash_profile'
  owner node['jrb_workstation']['user']
  mode 0644
end

cookbook_file "#{node['jrb_workstation']['home']}/Library/Fonts/Meslo LG M Regular for Powerline.ttf" do
  source 'fonts/Meslo LG M Regular for Powerline.ttf'
  owner node['jrb_workstation']['user']
  mode 0644
end
