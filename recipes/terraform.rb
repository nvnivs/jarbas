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
  action  [ :create, :modify ]
  members node['jarbas']['user']
  append  true
end

node['jarbas']['terraform']['versions'].each do |v|
  execute "terraform[#{v}]" do
    command "tfenv install #{v}"
    not_if  "tfenv list |grep -e '#{v}'"
    # Setting working directory to /tmp otherwise mkdirtmp will try to create on root on mac_os_x
    cwd     '/tmp'
  end
end

file 'version' do
  content node['jarbas']['terraform']['default_version']
  group   'tfenv'
  mode    '664'
  # TODO: Version needs to be dynamically foud on macox otherwise thiw will error everytime the version changes
  path    platform?('mac_os_x') ? '/usr/local/Cellar/tfenv/2.2.3/version' : '/var/lib/tfenv/version'
end

# Terragrunt
jarbas_yay_package 'terragrunt' do
  not_if { platform?('mac_os_x') }
end

homebrew_package 'terragrunt' do
  options '--ignore-dependencies'
  only_if { platform?('mac_os_x') }
end

# Plugins; Broken, install script no longer supported
#jarbas_execute 'terraform_plugin[godaddy]' do
#  command 'curl -s https://raw.githubusercontent.com/n3integration/terraform-godaddy/master/install.sh |bash -'
#  not_if  { ::File.exist?("#{node['jarbas']['home']}/.terraform/plugins/terraform-godaddy") }
#end
