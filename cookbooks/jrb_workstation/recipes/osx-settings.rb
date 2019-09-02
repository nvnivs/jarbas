#
# Cookbook:: jrb_workstation
# Recipe:: osx-settings
#
# Copyright:: 2019, The Authors, All Rights Reserved.

execute 'disable_dashboard' do
  command 'defaults write com.apple.dashboard mcx-disabled -boolean YES && killall Dock'
  only_if 'ps ax |grep [D]ash'
  user node['jrb_workstation']['user']
  environment ({
    'HOME' => node['jrb_workstation']['home'],
    'USER' => node['jrb_workstation']['user'] })
  cwd node['jrb_workstation']['home']
end


