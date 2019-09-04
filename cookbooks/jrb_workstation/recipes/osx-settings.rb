#
# Cookbook:: jrb_workstation
# Recipe:: osx-settings
#
# Copyright:: 2019, The Authors, All Rights Reserved.

jrb_workstation_execute 'disable_dashboard' do
  command 'defaults write com.apple.dashboard mcx-disabled -boolean YES && killall Dock'
  only_if 'ps ax |grep [D]ash'
end

jrb_workstation_execute 'set_dark_appearance' do
  # killall Dock is not reloading
  command 'defaults write NSGlobalDomain AppleInterfaceStyle Dark && killall Dock'
  # guard is not working, executes all the time
  not_if 'defaults read -g AppleInterfaceStyle |grep Dark'
end

jrb_workstation_execute 'finder_show_all_files' do
  command 'defaults write com.apple.finder AppleShowAllFiles YES'
end
