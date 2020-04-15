#
# Cookbook:: jrb_workstation
# Recipe:: terraform
#
# Copyright:: 2020, The Authors, All Rights Reserved.

package 'terraform' do
  version node.default['jrb_workstation']['terraform']['version']
end
