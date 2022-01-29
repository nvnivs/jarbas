#
# Cookbook:: jarbas
# Recipe:: packages
#
# Copyright:: 2020, The Authors, All Rights Reserved.

# Homebrew taps, mac_os_x only
node['jarbas']['packages']['homebrew_taps'].each do |tap|
  homebrew_tap tap do
    only_if { platform?('mac_os_x') }
  end
end

node['jarbas']['packages']['homebrew_untap'].each do |tap|
  homebrew_tap tap do
    action  :untap
    only_if { platform?('mac_os_x') }
  end
end

# Packages to install
node['jarbas']['packages']['install'].each do |p|
  jarbas_package p
end

# Arch only packages, targets packages that are not suported on brew
node['jarbas']['packages']['arch'].each do |p|
  jarbas_package p do
    action  :install
    only_if { platforms?('arch', 'manjaro') }
  end
end

# AUR packages for arch only
node['jarbas']['packages']['aur'].each do |p|
  jarbas_yay_package p do
    action  :install
    only_if { platform?('arch', 'manjaro') }
  end
end

# Homebrew packages, mac_os_x only
node['jarbas']['packages']['homebrew'].each do |p|
  homebrew_package p do
    action :install
    only_if { platform?('mac_os_x') }
  end
end

# Install cask, mac_os_x only
casks = node['jarbas']['packages']['homebrew_casks']
casks.each do |c|
  homebrew_cask c do
    only_if { platform?('mac_os_x') }
  end
end

# Update outdated casks, mac_os_x only
outdated_casks do |cask|
  jarbas_execute "brew_cask_upgrade[#{cask}]" do
    command "brew cask upgrade #{cask}"
    only_if { casks.include? cask }
    only_if { platform?('mac_os_x') }
  end
end
