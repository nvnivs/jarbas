#
# Cookbook:: jarbas
# Recipe:: python
#
# Copyright:: 2019, The Authors, All Rights Reserved.

jarbas_package 'python'

# pip
case node['platform']
when 'arch', 'manjaro'
  jarbas_package 'python-pip'
when 'mac_os_x'
  # Skip, Homebrew installs pip3 pointing to the Homebrew’d Python 3 for you.
  nil
else
  raise 'Unsupported platform'
end

# pytest
case node['platform']
when 'arch', 'manjaro'
  jarbas_package 'python-pytest'
else
  raise 'Unsupported platform'
end

jarbas_vscode_extension 'ms-python.python'

# pip packages
pip_packages = %w(tox pre-commit)
pip_packages.each do |p|
  jarbas_execute "pip_package[#{p}]" do
    command "pip3 install #{p}"
    not_if  "pip3 list |grep #{p}",
      user: node['jarbas']['user'],
      environment: {
        'HOME' => node['jarbas']['home'],
        'USER' => node['jarbas']['user'],
      }
  end
end
