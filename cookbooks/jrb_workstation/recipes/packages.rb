#
# Cookbook:: jrb_workstation
# Recipe:: packages
#
# Copyright:: 2020, The Authors, All Rights Reserved.

# Packages to install / upgrade
node['jrb_workstation']['packages']['upgrade'].each do |p|
  package p do
    action :upgrade
  end
end

# Packages to install only (no upgrade support)
node['jrb_workstation']['packages']['install'].each do |p|
  package p
end
