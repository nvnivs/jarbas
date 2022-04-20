#
# Cookbook:: jarbas
# Recipe:: mac_os_x
#
# Copyright:: 2019, The Authors, All Rights Reserved.

ruby_block 'Disable admin password prompt' do
  block do
    sudoers = Chef::Util::FileEdit.new('/etc/sudoers')
    sudoers.search_file_replace_line(/^\%admin  ALL=\(ALL\) ALL$/,
      '%admin  ALL=(ALL) NOPASSWD: ALL')
    sudoers.write_file
  end
end

automatic_software_updates "enables automatic check, download, and install of software updates" do
  check             true
  download          true
  install_os        true
  install_app_store true
  install_critical  true
end

command_line_tools 'install command line tools'

jarbas_execute 'brew upgrade' do
  command     'brew upgrade'
  live_stream true
  only_if     '[ $(brew outdated| wc -l) -gt 0 ]', :user => node['jarbas']['user']
end

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
