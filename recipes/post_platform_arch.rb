#
# Cookbook:: jarbas
# Recipe:: post_platform_arch
#
# Copyright:: 2020, The Authors, All Rights Reserved.

execute 'Pacman clean' do
  command     'pacman -Sc --noconfirm'
  live_stream true
end

execute 'Yay update' do
  command     'yay -Syu --builddir=/tmp/ --noconfirm'
  live_stream true
end

execute 'Yay clean' do
  command     'yay -Sc --noconfirm'
  live_stream true
  only_if     { ::File.directory?('/var/cache/yay') }
end

# TODO: guard needs to change if not manjaro
reboot 'Kernel changed' do
  action     :request_reboot
  reason     'Kernel changed, rebooting...'
  delay_mins 2
  only_if    '$(pacman -Q linux |cut -d " " -f2) != $(uname -r |sed s/-MANJARO//g)'
end
