#
# Cookbook:: jrb_workstation
# Recipe:: ruby
#
# Copyright:: 2019, The Authors, All Rights Reserved.

rvm_path='~/.rvm/scripts/rvm'

package 'ruby'
package 'gnupg'

node['jrb_workstation']['ruby']['gpg_keys'].each do |key|
  jrb_workstation_execute "install_gpg_key[#{key}]" do
    command "gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys #{key}"
    not_if  "gpg2 --list-keys | grep #{key}"
  end
end

jrb_workstation_execute 'install_rvm' do
  command 'curl -sSL https://get.rvm.io | bash -s stable'
  not_if  "which rvm"
end

node['jrb_workstation']['ruby']['rubies'].each do |version|
  jrb_workstation_execute "install_ruby[#{version}]" do
    command "source #{rvm_path}; rvm install #{version}"
    not_if  "source #{rvm_path}; rvm list | grep -E #{version}"
  end
end

#TODO: Defaut is not setting
jrb_workstation_execute 'set_default_ruby' do
  command "#{rvm_path} --default #{node['jrb_workstation']['ruby']['default_version']}"
  not_if  "#{rvm_path} list | grep -F '* #{node['jrb_workstation']['ruby']['default_version']}'"
end

#TODO: Gems are not installing
node['jrb_workstation']['ruby']['gems'].each do |g|
  jrb_workstation_execute "install_gem[#{g}]" do
    command "gem install #{g}"
    not_if  "gem list | grep -E \"#{g}\""
  end
end
