#
# Cookbook:: jarbas
# Recipe:: terraform
#
# Copyright:: 2020, The Authors, All Rights Reserved.

# Install tfenv package
case node['platform']
when 'arch', 'manjaro'
  jarbas_yay_package 'tfenv'
when 'mac_os_x'
  homebrew_package 'tfenv'
else
  raise 'Unsupported platform'
end

# User needs to reload a new session for groups to load
group 'tfenv' do
  action   [ :create, :modify ]
  members  node['jarbas']['user']
  append   true
  notifies :run, 'jarbas_execute[reload_tfenv_group]', :immediately
end

jarbas_execute 'reload_tfenv_group' do
  command 'newgrp tfenv'
  action  :nothing
  not_if  { platform?('mac_os_x') }
end

directory '/opt/tfenv/versions' do
  owner  'root'
  group  'root'
  mode   '0777'
  not_if { platform?('mac_os_x') }
end

directory '/usr/local/Cellar/tfenv/2.2.3/versions' do
  owner  'root'
  group  'wheel'
  mode   '0777'
  only_if { platform?('mac_os_x') }
end

# Terragrunt
case node['platform']
when 'arch', 'manjaro'
  jarbas_package 'terragrunt'
when 'mac_os_x'
  homebrew_package 'terragrunt' do
    options '--ignore-dependencies'
  end
else
  raise 'Unsupported platform'
end

# Tflint
case node['platform']
when 'arch', 'manjaro'
  jarbas_yay_package 'tflint-bin'
when 'mac_os_x'
  homebrew_package 'tflint'
else
  raise 'Unsupported platform'
end

# tfsec
case node['platform']
when 'arch', 'manjaro'
  jarbas_yay_package 'tfsec-bin'
when 'mac_os_x'
  homebrew_package 'tfsec'
else
  raise 'Unsupported platform'
end

# checkov
jarbas_execute 'pip_package[checkov]' do
  command 'pip3 install checkov'
  not_if  'pip3 list |grep checkov',
    user: node['jarbas']['user'],
    environment: {
      'HOME' => node['jarbas']['home'],
      'USER' => node['jarbas']['user'],
    }
end

# terrascan
case node['platform']
when 'arch', 'manjaro'
  jarbas_yay_package 'terrascan'
when 'mac_os_x'
  homebrew_package 'terrascan'
else
  raise 'Unsupported platform'
end
