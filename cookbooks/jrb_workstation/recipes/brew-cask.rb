#
# Cookbook:: jrb_workstation
# Recipe:: brew_cask
#
# Copyright:: 2019, The Authors, All Rights Reserved.

node['jrb_workstation']['brew']['taps'].each do |tap|
  homebrew_tap tap
end

node['jrb_workstation']['brew']['taps_blacklist'].each do |tap|
  homebrew_tap tap do
    action :untap
  end
end

# Install wanted casks
casks = node['jrb_workstation']['brew']['casks']
casks.each do |c|
  homebrew_cask c
end

# Remove unwanted casks
casks_blacklist = node['jrb_workstation']['brew']['casks_blacklist']
casks_blacklist.each do |c|
  homebrew_cask c do
    action :remove
  end
end

# Update outdated casks
outdated_casks do |cask|
  execute "brew_cask_upgrade[#{cask}]" do
    command "brew cask upgrade #{cask}"
    only_if { casks.include? cask }
    user node['jrb_workstation']['user']
    environment ({
      'HOME' => node['jrb_workstation']['home'],
      'USER' => node['jrb_workstation']['user'] })
    cwd node['jrb_workstation']['home']
  end
end
