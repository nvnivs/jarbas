#
# Cookbook:: jrb_workstation
# Recipe:: ruby
#
# Copyright:: 2019, The Authors, All Rights Reserved.

package 'ruby'

# Required by RVM
package 'gpg2' do
  action :upgrade
end

jrb_workstation_execute 'install_rvm' do
  command 'curl -sSL https://get.rvm.io | bash -s stable'
  not_if  'which rvm'
end

node['jrb_workstation']['ruby']['rubies'].each do |version|
  jrb_workstation_execute "install_ruby[#{version}]" do
    command "rvm install #{version}"
    not_if  "rvm list | grep -E #{version}"
  end
end

jrb_workstation_execute 'set_default_ruby' do
  command "rvm --default #{node['jrb_workstation']['ruby']['default_version']}"
  not_if  "rvm list | grep -F '* #{node['jrb_workstation']['ruby']['default_version']}'"
end

node['jrb_workstation']['ruby']['gems'].each do |g|
  jrb_workstation_execute "install_gem[#{g}]" do
    command "gem install #{g}"
    not_if  "gem list | grep -E \"#{g}\""
  end
end
