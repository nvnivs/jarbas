#
# Cookbook:: jarbas
# Recipe:: vscode
#
# Copyright:: 2019, The Authors, All Rights Reserved.

case node['platform']
when 'arch', 'manjaro'
  jarbas_yay_package 'visual-studio-code-bin'
when 'mac_os_x'
  homebrew_cask 'visual-studio-code' do
    owner   node['jarbas']['user']
  end
else
  raise 'Unsupported platform'
end

# Brew installs as root so permissions on the folders need to be fixed
execute 'Set ownership of Code folders' do
  command "chown -R #{node['jarbas']['user']} '#{node['jarbas']['home']}/Library/Application Support/Code'"
  only_if [ platform?('mac_os_x') ]
  only_if "stat -f='%Su' '#{node['jarbas']['home']}/Library/Application Support/Code' |grep root"
end

execute 'Set ownership of Code logs folders' do
  command "chown -R #{node['jarbas']['user']} '#{node['jarbas']['home']}/Library/Application Support/Code/logs'"
  only_if [ platform?('mac_os_x') ]
  only_if "stat -f='%Su' '#{node['jarbas']['home']}/Library/Application Support/Code/logs' |grep root"
end

# Install extensions
node['jarbas']['vscode']['extensions'].each do |e|
  jarbas_vscode_extension e
end
