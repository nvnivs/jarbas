#
# Cookbook:: jarbas
# Recipe:: firefox
#
# Copyright:: 2021, The Authors, All Rights Reserved.

if node['platform'] == 'mac_os_x' then
    homebrew_cask 'firefox-developer-edition'
else
    jarbas_package 'firefox-developer-edition'
end