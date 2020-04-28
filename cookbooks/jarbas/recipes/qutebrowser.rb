#
# Cookbook:: jarbas
# Recipe:: qutebrowser
#
# Copyright:: 2020, The Authors, All Rights Reserved.

package 'qutebrowser' do
  not_if { node['platform'] == 'mac_os_x' }
end

homebrew_cask 'qutebrowser' do
  only_if { node['platform'] == 'mac_os_x' }
end
