# Cookbook:: jrb_workstation
# Recipe:: brew
#
# Copyright:: 2019, The Authors, All Rights Reserved.

include_recipe 'homebrew::default'

node['jrb_workstation']['brew']['packages'].each do |p|
  homebrew_package p do
    action :upgrade
  end
end

# Upgrade for tcptraceroute is failing with "Error: tcptraceroute 1.5beta7_1 already installed"
homebrew_package 'tcptraceroute'
