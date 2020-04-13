#
# Cookbook:: jrb_workstation
# Recipe:: terraform
#
# Copyright:: 2020, The Authors, All Rights Reserved.

#TODO: version is getting flagrantly ignored
# There's a terraform cookbook, might be better than this
package 'terraform' do
  action  :upgrade
  version '0.12.18'
end
