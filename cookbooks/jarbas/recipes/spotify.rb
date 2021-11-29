#
# Cookbook:: jarbas
# Recipe:: spotify
#
# Copyright:: 2021, The Authors, All Rights Reserved.

if node['platform'] == 'mac_os_x' then
    raise 'Unsupported platform'
else
    jarbas_yay_package 'spotify'
end
