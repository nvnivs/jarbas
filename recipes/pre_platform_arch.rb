#
# Cookbook:: jarbas
# Recipe:: pre_platform_arch
#
# Copyright:: 2020, The Authors, All Rights Reserved.

execute 'Pacman update' do
  command     'pacman -Syyu --noconfirm'
  only_if     'checkupdates'
  live_stream true
end

execute 'Yay update' do
  command           'yay -Syu --builddir=/tmp/ --noconfirm'
  not_if            '[[ $(yay -Qu |wc -l) == 0 ]]'
  live_stream       true
end
