#
# Cookbook:: jarbas
# Recipe:: python
#
# Copyright:: 2019, The Authors, All Rights Reserved.

jarbas_package 'python'

# Pip
case node['platform']
when 'arch', 'manjaro'
  jarbas_package 'python-pip'
when 'mac_os_x'
  # Skip, Homebrew installs pip3 pointing to the Homebrew’d Python 3 for you.
else
  raise 'Unsupported platform'
end

# code extensions
code_extensions = ['ms-python.python']
code_extensions.each do |e|
  jarbas_execute "install_vscode_extension[#{e}]" do
    command "code --install-extension #{e}"
    not_if "code --list-extensions |grep #{e}"
  end
end
