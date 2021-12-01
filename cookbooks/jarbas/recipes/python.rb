#
# Cookbook:: jarbas
# Recipe:: python
#
# Copyright:: 2019, The Authors, All Rights Reserved.

jarbas_package 'python'


# Pip
case node['platform']
when 'arch', 'manjaro'
  jarbas_package 'python-pip'
when 'mac_os_x'
  jarbas_execute 'install-pip' do
    command 'sudo easy_install pip'
    not_if  'which pip'
  end
else
  raise 'Unsupported platform'
end
