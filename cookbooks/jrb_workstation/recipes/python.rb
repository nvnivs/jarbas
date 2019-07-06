#
# Cookbook:: jrb_workstation
# Recipe:: python
#
# Copyright:: 2019, The Authors, All Rights Reserved.
#
package 'python' do
  action :upgrade
end

package 'python3' do
  action :upgrade
end

execute 'download-pip' do
  command 'curl -s https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py'
  not_if 'which pip'
  notifies :run, 'execute[install-pip]', :immediately
end

execute 'install-pip' do
  command 'python3 /tmp/get-pip.py --user'
  action :nothing
  user node['jrb_workstation']['user']
  environment ({
    'HOME' => node['jrb_workstation']['home'],
    'USER' => node['jrb_workstation']['user'] })
  cwd node['jrb_workstation']['home']
end

execute 'install-awscli' do
  command 'pip3 install awscli --upgrade --user'
  not_if 'which aws'
  user node['jrb_workstation']['user']
  environment ({
    'HOME' => node['jrb_workstation']['home'],
    'USER' => node['jrb_workstation']['user'] })
  cwd node['jrb_workstation']['home']
end

execute 'install-powerline-shell' do
  command 'pip3 install powerline-shell --upgrade --user'
  not_if 'which powerline-shell'
  user node['jrb_workstation']['user']
  environment ({
    'HOME' => node['jrb_workstation']['home'],
    'USER' => node['jrb_workstation']['user'] })
  cwd node['jrb_workstation']['home']
end
