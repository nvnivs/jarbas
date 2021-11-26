#
# Cookbook:: jarbas
# Recipe:: brave
#
# Copyright:: 2021, The Authors, All Rights Reserved.

if node['platform'] == 'mac_os_x' then
    homebrew_cask 'brave-browser'
else
    jarbas_yay_package 'brave-bin'
end

#TODO: Install extensions programatically
# Bitwarden
# Translate