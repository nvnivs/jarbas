#
# Cookbook:: jarbas
# Recipe:: brave
#
# Copyright:: 2021, The Authors, All Rights Reserved.

jarbas_yay_package 'brave-bin' do
    not_if [ node['platform'] == 'mac_os_x' ]
end
