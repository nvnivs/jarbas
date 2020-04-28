#
# Cookbook:: jarbas
# Recipe:: terraform
#
# Copyright:: 2020, The Authors, All Rights Reserved.

# Install tfenv package
jarbas_aur 'tfenv' do
  action    [ :build, :install ]
  only_if   { node['platform'] == 'arch' }
end

homebrew_package 'tfenv' do
  action    :upgrade
  only_if   { node['platform'] == 'mac_os_x' }
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
  mode    0664
  path    case node['platform']
          when 'mac_os_x'
            '/usr/local/Cellar/tfenv/1.0.2/version'
          else
            '/var/lib/tfenv/version'
          end
end

# Terragrunt
jarbas_aur 'terragrunt' do
  action  [ :build, :install ]
  only_if { node['platform'] == 'arch' }
end

homebrew_package 'terragrunt' do
  action  :upgrade
  options '--ignore-dependencies'
  only_if { node['platform'] == 'mac_os_x' }
end
