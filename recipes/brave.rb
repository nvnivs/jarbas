#
# Cookbook:: jarbas
# Recipe:: brave
#
# Copyright:: 2021, The Authors, All Rights Reserved.

case node['platform']
when 'arch', 'manjaro'
  jarbas_yay_package 'brave-bin'
when 'mac_os_x'
  homebrew_cask 'brave-browser'
else
  raise 'Unsupported platform'
end

# TODO: Set dark theme
# TODO: Install extensions programatically
# Bitwarden
# Translate
