#
# Cookbook:: jrb_workstation
# Recipe:: aws
#
# Copyright:: 2019, The Authors, All Rights Reserved.

package 'aws-cli' do
  not_if { node['platform'] == 'mac_os_x' }
end

jrb_workstation_execute 'pip-install[awscli]' do
  command 'pip install awscli --upgrade'
  not_if  'which aws'
  only_if [ node['platform'] == 'mac_os_x' ]
end

