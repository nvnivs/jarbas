#
# Cookbook:: jrb_workstation
# Recipe:: python
#
# Copyright:: 2019, The Authors, All Rights Reserved.
#
package 'python'

package 'python3'

execute 'download-pip3' do
  command 'curl -s https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py'
  not_if 'which pip3'
  notifies :run, 'execute[install-pip]', :immediately
  user node['jrb_workstation']['user']
  environment ({
    'HOME' => node['jrb_workstation']['home'],
    'USER' => node['jrb_workstation']['user'] })
  cwd node['jrb_workstation']['home']
end

execute 'install-pip3' do
  command 'python /tmp/get-pip.py --user'
  action :nothing
  user node['jrb_workstation']['user']
  environment ({
    'HOME' => node['jrb_workstation']['home'],
    'USER' => node['jrb_workstation']['user'] })
  cwd node['jrb_workstation']['home']
end

execute 'install-pip' do
  command 'sudo easy_install pip'
  not_if 'which pip'
  user node['jrb_workstation']['user']
  environment ({
    'HOME' => node['jrb_workstation']['home'],
    'USER' => node['jrb_workstation']['user'] })
  cwd node['jrb_workstation']['home']
end

execute 'pip-install[awscli]' do
  command 'pip install awscli --upgrade'
  not_if 'which aws'
end

execute 'pip-install[powerline-shell]' do
  command 'pip install powerline-shell --upgrade'
  not_if 'which powerline-shell'
end
