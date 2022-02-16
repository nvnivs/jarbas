#
# Cookbook:: jarbas
# Recipe:: mac_os_x
#
# Copyright:: 2019, The Authors, All Rights Reserved.

cookbook_file '/etc/sudoers' do
  source 'sudoers_nopass'
  owner 'root'
  group 'wheel'
  mode '0440'
end

command_line_tools 'install command line tools'
include_recipe 'homebrew::default'

execute 'kill_dock' do
  command 'killall Dock'
  action :nothing
end

plist 'disable dashboard' do
  path "#{node['jarbas']['home']}/Library/Preferences/com.apple.dashboard.plist"
  entry 'mcx-disabled'
  value true
  only_if 'ps ax |grep [D]ash'
  notifies :run, 'execute[kill_dock]', :delayed
end

plist 'General: Appearance' do
  path "#{node['jarbas']['home']}/Library/Preferences/.GlobalPreferences.plist"
  entry 'AppleInterfaceStyle'
  value 'Dark'
  not_if "sudo -u #{node['jarbas']['user']} defaults read NSGlobalDomain |grep AppleInterfaceStyle |grep Dark"
end

plist 'General: Accent colour' do
  path "#{node['jarbas']['home']}/Library/Preferences/.GlobalPreferences.plist"
  entry 'AppleAquaColorVariant'
  value 6
  not_if "sudo -u #{node['jarbas']['user']} defaults read NSGlobalDomain |grep AppleAquaColorVariant |grep 6"
end

plist 'show hidden files in finder' do
  path "#{node['jarbas']['home']}/Library/Preferences/com.apple.finder.plist"
  entry 'AppleShowAllFiles'
  value true
  not_if "sudo -u #{node['jarbas']['user']} defaults read com.apple.finder AppleShowAllFiles |grep 1"
end
