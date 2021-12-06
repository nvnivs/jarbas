#
# Cookbook:: jarbas
# Recipe:: spotify
#
# Copyright:: 2021, The Authors, All Rights Reserved.

jarbas_execute 'install_gpg_key[931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90]' do
  command 'gpg2 --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90'
  not_if  'gpg2 -k 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90',
          :user => node['jarbas']['user'],
          :environment => { 'HOME' => node['jarbas']['home']}
end

case node['platform']
when 'arch', 'manjaro'
  jarbas_yay_package 'spotify'
when 'mac_os_x'
  homebrew_cask 'spotify'
else
  raise 'Unsupported platform'
end
