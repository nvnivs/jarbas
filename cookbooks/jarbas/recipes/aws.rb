#
# Cookbook:: jarbas
# Recipe:: aws
#
# Copyright:: 2019, The Authors, All Rights Reserved.

case node['platform']
when 'arch', 'manjaro'
  jarbas_package 'aws-cli'
when 'mac_os_x'
  include_recipe 'jarbas::python'

  jarbas_execute 'pip-install[awscli]' do
    command 'pip3 install awscli --upgrade'
    not_if  'which aws'
  end
else
  raise 'Unsupported platform'
end
