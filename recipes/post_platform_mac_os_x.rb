#
# Cookbook:: jarbas
# Recipe:: platform_mac_os_x_post
#
# Copyright:: 2021, The Authors, All Rights Reserved.

jarbas_execute 'softwareupdate' do
  command     'softwareupdate --all --install --force'
  live_stream true
  guard_interpreter :bash
  not_if      'softwareupdate -l 2> >(grep -F "No new software available.")'
end

jarbas_execute 'brew upgrade' do
  command     'brew upgrade'
  live_stream true
  not_if      'exit $(brew outdated| wc -l)'
end

cookbook_file '/etc/sudoers' do
  source 'sudoers'
  owner 'root'
  group 'wheel'
  mode '0440'
end
