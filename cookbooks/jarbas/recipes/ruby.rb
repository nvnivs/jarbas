#
# Cookbook:: jarbas
# Recipe:: ruby
#
# Copyright:: 2019, The Authors, All Rights Reserved.

rvm_path = "#{node['jarbas']['home']}/.rvm/scripts/rvm"
user     = node['jarbas']['user']

package 'ruby'
package 'gnupg'

node['jarbas']['ruby']['gpg_keys'].each do |key|
  jarbas_execute "install_gpg_key[#{key}]" do
    command "gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys #{key}"
    not_if  "gpg2 -k #{key}",
            :user => user,
            :environment => { 'HOME' => node['jarbas']['home']}
  end
end

jarbas_execute 'install_rvm' do
  command 'curl -sSL https://get.rvm.io | bash -s stable'
  not_if  'which rvm', :user => user
end

node['jarbas']['ruby']['rubies'].each do |version|
  jarbas_execute "install_ruby[#{version}]" do
    command "source #{rvm_path}; rvm install #{version}"
    not_if  "source #{rvm_path}; rvm list | grep -E #{version}", :user => user
  end
end

jarbas_execute 'default_ruby' do
  command "source #{rvm_path}; rvm alias create default #{node['jarbas']['ruby']['default_version']}"
  not_if  "source #{rvm_path}; rvm list | grep -F '* #{node['jarbas']['ruby']['default_version']}'", :user => user
end

node['jarbas']['ruby']['gems'].each do |g|
  jarbas_execute "install_gem[#{g}]" do
    command "gem install #{g}"
    not_if  "gem list | grep -E '#{g}'",
            :user => user,
            :environment => { 'HOME' => node['jarbas']['home']}
  end
end
