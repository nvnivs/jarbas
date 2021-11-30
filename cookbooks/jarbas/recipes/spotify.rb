#
# Cookbook:: jarbas
# Recipe:: spotify
#
# Copyright:: 2021, The Authors, All Rights Reserved.

if node['platform'] == 'mac_os_x' then
    homebrew_cask 'spotify'
else
    jarbas_yay_package 'spotify'
end
