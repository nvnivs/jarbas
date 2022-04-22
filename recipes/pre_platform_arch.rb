#
# Cookbook:: jarbas
# Recipe:: pre_platform_arch
#
# Copyright:: 2020, The Authors, All Rights Reserved.

execute 'Pacman update' do
  command     'pacman -Syyu --noconfirm'
  only_if     'checkupdates'
  live_stream true
  notifies    :run, 'execute[Pacman clean]', :immediately
end

execute 'Pacman clean' do
  command     'pacman -Sc --noconfirm'
  live_stream true
  action      :nothing
end

execute 'Yay update' do
  command     'yay -Syu --builddir=/tmp/ --noconfirm'
  not_if      'yay -Qu |wc -l', user: node['jarbas']['user']
  live_stream true
  notifies    :run, 'execute[Yay clean]', :immediately
end

execute 'Yay clean' do
  command     'yay -Sc --noconfirm'
  live_stream true
  only_if     { ::File.directory?('/var/cache/yay') }
  action      :nothing
end
