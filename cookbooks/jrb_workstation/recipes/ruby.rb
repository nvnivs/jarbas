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

execute 'install_rvm' do
  command 'curl -sSL https://get.rvm.io | bash -s stable'
  not_if 'which rvm'
  user node['jrb_workstation']['user']
  environment ({
    'HOME' => node['jrb_workstation']['home'],
    'USER' => node['jrb_workstation']['user'] })
  cwd node['jrb_workstation']['home']
end

node['jrb_workstation']['ruby']['rubies'].each do |version|
  execute "install_ruby[#{version}]" do
    command "rvm install #{version}"
    not_if "rvm list | grep -E #{version}"
    user node['jrb_workstation']['user']
    environment ({
      'HOME' => node['jrb_workstation']['home'],
      'USER' => node['jrb_workstation']['user'] })
    cwd node['jrb_workstation']['home']
  end
end

execute 'set_default_ruby' do
  command "rvm --default #{node['jrb_workstation']['ruby']['default_version']}"
  not_if"rvm list | grep -F '* #{node['jrb_workstation']['ruby']['default_version']}'"
  user node['jrb_workstation']['user']
  environment ({
    'HOME' => node['jrb_workstation']['home'],
    'USER' => node['jrb_workstation']['user'] })
  cwd node['jrb_workstation']['home']
end

node['jrb_workstation']['ruby']['gems'].each do |g|
  execute "install_gem[#{g}]" do
    command "gem install #{g}"
    not_if "gem list | grep -E \"#{g}\""
    user node['jrb_workstation']['user']
    environment ({
      'HOME' => node['jrb_workstation']['home'],
      'USER' => node['jrb_workstation']['user'] })
    cwd node['jrb_workstation']['home']
  end
end
