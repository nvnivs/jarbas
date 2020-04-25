#
# Cookbook:: jarbas
# Recipe:: python
#
# Copyright:: 2019, The Authors, All Rights Reserved.
#
package 'python'
package 'python3'

package 'python-pip' do
  not_if { node['platform'] == 'mac_os_x' }
end

jarbas_execute 'install-pip' do
  command 'sudo easy_install pip'
  not_if  'which pip'
  only_if { node['platform'] == 'mac_os_x' }
end
