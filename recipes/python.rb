#
# Cookbook:: jarbas
# Recipe:: python
#
# Copyright:: 2019, The Authors, All Rights Reserved.

jarbas_package 'python'

# pip packages
pip_packages = %w(pip pytest tox pre-commit)
pip_packages.each do |p|
  case node['platform']
  when 'arch', 'manjaro'
    jarbas_package "python-#{p}"
  when 'mac_os_x'
    jarbas_execute "pip_package[#{p}]" do
      command "pip3 install #{p}"
      not_if  "pip3 list |grep #{p}",
        user: node['jarbas']['user'],
        environment: {
          'HOME' => node['jarbas']['home'],
          'USER' => node['jarbas']['user'],
        }
    end
  else
    raise 'Unsupported platform'
  end
end

jarbas_vscode_extension 'ms-python.python'
