#
# Cookbook:: jrb_workstation
# Recipe:: terraform
#
# Copyright:: 2020, The Authors, All Rights Reserved.

jrb_workstation_aur 'tfenv' do
  action [ :build, :install ]
end

# User needs to reload a new session for groups to load
group 'tfenv' do
  action  [ :create, :modify ]
  members node['jrb_workstation']['user']
  append  true
end

node['jrb_workstation']['terraform']['versions'].each do |v|
  execute "terraform[#{v}]" do
    command "tfenv install #{v}"
    not_if  "tfenv list |grep -e '#{v}'"
  end
end

file '/var/lib/tfenv/version' do
  content node['jrb_workstation']['terraform']['default_version']
  group   'tfenv'
  mode    0664
end
