#
# Cookbook:: jarbas
# Recipe:: pre_platform_arch
#
# Copyright:: 2020, The Authors, All Rights Reserved.

execute 'Pacman update' do
  command     'pacman -Syyu --noconfirm'
  live_stream true
end
