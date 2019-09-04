#
# Cookbook:: jrb_workstation
# Recipe:: osx-settings
#
# Copyright:: 2019, The Authors, All Rights Reserved.

jrb_workstation_execute 'disable_dashboard' do
  command 'defaults write com.apple.dashboard mcx-disabled -boolean YES && killall Dock'
  only_if 'ps ax |grep [D]ash'
end
