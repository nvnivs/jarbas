#
# Cookbook:: jarbas
# Recipe:: aws
#
# Copyright:: 2019, The Authors, All Rights Reserved.

case node['platform']
when 'arch', 'manjaro'
  jarbas_yay_package 'aws-cli-v2-bin'
when 'mac_os_x'
  include_recipe 'jarbas::python'

  jarbas_execute 'pip-install[awscli]' do
    command 'pip3 install awscli --upgrade'
    not_if  'which aws'
  end
else
  raise 'Unsupported platform'
end

# Session Manager plugin
case node['platform']
when 'arch', 'manjaro'
  jarbas_yay_package 'aws-session-manager-plugin'
when 'mac_os_x'
  homebrew_cask 'session-manager-plugin'
else
  raise 'Unsupported platform'
end

# Saml2AWS
case node['platform']
when 'arch', 'manjaro'
  jarbas_yay_package 'saml2aws'
when 'mac_os_x'
  homebrew_cask 'saml2aws'
else
  raise 'Unsupported platform'
end
