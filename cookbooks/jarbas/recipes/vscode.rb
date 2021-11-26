#
# Cookbook:: jarbas
# Recipe:: vscode
#
# Copyright:: 2019, The Authors, All Rights Reserved.

homebrew_cask 'visual-studio-code' do
  only_if [ node['platform'] == 'mac_os_x' ]
  owner   node['jarbas']['user']
end

# Brew installs as root so permissions on the folders need to be fixed
execute 'Set ownership of Code folders' do
  command "chown -R #{node['jarbas']['user']} '#{node['jarbas']['home']}/Library/Application Support/Code'"
  only_if [ node['platform'] == 'mac_os_x' ]
  only_if "stat -f='%Su' '#{node['jarbas']['home']}/Library/Application Support/Code' |grep root"
end

execute 'Set ownership of Code logs folders' do
  command "chown -R #{node['jarbas']['user']} '#{node['jarbas']['home']}/Library/Application Support/Code/logs'"
  only_if [ node['platform'] == 'mac_os_x' ]
  only_if "stat -f='%Su' '#{node['jarbas']['home']}/Library/Application Support/Code/logs' |grep root"
end

jarbas_yay_package 'visual-studio-code-bin' do
  not_if [ node['platform'] == 'mac_os_x' ]
end

node['jarbas']['vscode']['extensions'].each do |e|
  jarbas_execute "install_vscode_extension[#{e}]" do
    command "code --install-extension #{e}"
    not_if "code --list-extensions |grep #{e}"
  end
end
