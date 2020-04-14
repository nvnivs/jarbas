#
# Cookbook:: jrb_workstation
# Recipe:: ruby
#
# Copyright:: 2019, The Authors, All Rights Reserved.

rvm_path = "#{node['jrb_workstation']['home']}/.rvm/scripts/rvm"
user     = node['jrb_workstation']['user']

package 'ruby'
package 'gnupg'

#TODO: Guard not working
node['jrb_workstation']['ruby']['gpg_keys'].each do |key|
  jrb_workstation_execute "install_gpg_key[#{key}]" do
    command "gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys #{key}"
    not_if  "gpg2 --list-keys | grep '#{key}'", :user => user
  end
end

jrb_workstation_execute 'install_rvm' do
  command 'curl -sSL https://get.rvm.io | bash -s stable'
  not_if  'which rvm', :user => user
end

node['jrb_workstation']['ruby']['rubies'].each do |version|
  jrb_workstation_execute "install_ruby[#{version}]" do
    command "source #{rvm_path}; rvm install #{version}"
    not_if  "source #{rvm_path}; rvm list | grep -E #{version}", :user => user
  end
end

jrb_workstation_execute 'default_ruby' do
  command "source #{rvm_path}; rvm alias create default #{node['jrb_workstation']['ruby']['default_version']}"
  not_if  "source #{rvm_path}; rvm list | grep -F '* #{node['jrb_workstation']['ruby']['default_version']}'", :user => user
end

#TODO: Guard not working
node['jrb_workstation']['ruby']['gems'].each do |g|
  jrb_workstation_execute "install_gem[#{g}]" do
    command           "gem install #{g}"
    not_if            "gem list | grep -E '#{g}'", :user => user
  end
end
