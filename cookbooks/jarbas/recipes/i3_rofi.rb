#
# Cookbook:: jarbas
# Recipe:: i3_rofi
#
# Copyright:: 2021, The Authors, All Rights Reserved.

# rofi, a replacement for dmenu
jarbas_package 'rofi'

directory "#{home}/.config/rofi/" do
  owner user
  mode  '0755'
end

template "#{home}/.config/rofi/config" do
  source 'rofi_config.erb'
  owner  user
  mode   '0644'
end
