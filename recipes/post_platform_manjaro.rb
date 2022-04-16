#
# Cookbook:: jarbas
# Recipe:: platform_manjaro_post
#
# Copyright:: 2022, The Authors, All Rights Reserved.

include_recipe 'jarbas::post_platform_arch'

reboot 'Kernel changed' do
  action     :request_reboot
  reason     'Kernel changed, rebooting...'
  delay_mins 2
  only_if    '$(pacman -Q linux |cut -d " " -f2) != $(uname -r |sed s/-MANJARO//g)'
end
