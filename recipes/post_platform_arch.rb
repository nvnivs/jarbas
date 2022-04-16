#
# Cookbook:: jarbas
# Recipe:: post_platform_arch
#
# Copyright:: 2020, The Authors, All Rights Reserved.

execute 'Pacman clean' do
  command     'pacman -Sc --noconfirm'
  live_stream true
end

execute 'Yay clean' do
  command     'yay -Sc --noconfirm'
  live_stream true
  only_if     { ::File.directory?('/var/cache/yay') }
end
