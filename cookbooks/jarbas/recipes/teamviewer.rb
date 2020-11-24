#
# Cookbook:: jarbas
# Recipe:: teamviwer
#
# Copyright:: 2020, The Authors, All Rights Reserved.

jarbas_aur 'teamviewer' do
  action [ :build, :install ]
  only_if { node['platform'] == 'arch' }
end
