#
# Cookbook:: jarbas
# Recipe:: platform_mac_os_x_post
#
# Copyright:: 2021, The Authors, All Rights Reserved.

jarbas_execute 'softwareupdate' do
  command     'softwareupdate --all --install --force'
  live_stream true
end

jarbas_execute 'brew upgrade' do
  command     'brew upgrade'
  live_stream true
end
