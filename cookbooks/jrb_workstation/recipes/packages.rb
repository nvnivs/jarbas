#
# Cookbook:: jrb_workstation
# Recipe:: packages
#
# Copyright:: 2020, The Authors, All Rights Reserved.

# Packages to install or upgrade
node['jrb_workstation']['packages']['upgrade'].each do |p|
  package p do
    action :upgrade
  end
end

# Packages to install only (no upgrade support)
# Targets packages where brew fails on upgrade
node['jrb_workstation']['packages']['install'].each do |p|
  package p
end

# Arch only packages
# Targets packages that are not suported on brew
node['jrb_workstation']['packages']['arch'].each do |p|
  package p do
    action  :upgrade
    only_if { node['platform'] == 'arch' }
  end
end


