#
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

# Upgrade for htop is failing with "already installed"
homebrew_package 'htop'

# Upgrade for tcptraceroute is failing with "Error: tcptraceroute 1.5beta7_1 already installed"
homebrew_package 'tcptraceroute'

# Upgrade fails with "Error: wget 1.20.3_1 already installed"
homebrew_package 'wget'

# Upgrade fails with "e2fsprogs 1.44.5_1 already installed"
homebrew_package 'e2fsprogs'

# Upgrade fais with "Error: mtr 0.93_1 already installed"
homebrew_package 'mtr'

# Terraform should have a fixed version, MAKE IT HAPPEN
# homebrew_package 'terraform' do
#  action :upgrade
#  version '0.11.11' # Version is being blatantly ignored :(
# end
