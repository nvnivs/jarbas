#
# Cookbook:: jrb_workstation
# Recipe:: brew_cask
#
# Copyright:: 2019, The Authors, All Rights Reserved.

casks = node['jrb_workstation']['brew']['casks']

node['jrb_workstation']['brew']['taps'].each do |tap|
  homebrew_tap tap
end

node['jrb_workstation']['brew']['taps_blacklist'].each do |tap|
  homebrew_tap tap do
    action :untap
  end
end

casks.each do |c|
  homebrew_cask c
end

# Update outdated casks
outdated_casks.each_line do |cask|
  cask = cask.gsub('\n', '').strip
  execute "brew_cask_upgrade[#{cask}]" do
    command "brew cask upgrade #{cask}"
    only_if { casks.include? cask }
    user Homebrew.owner
    environment ({ 'HOME' => ::Dir.home(Homebrew.owner), 'USER' => Homebrew.owner })
    cwd ::Dir.home(Homebrew.owner)
  end
end
