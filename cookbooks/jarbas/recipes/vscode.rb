#
# Cookbook:: jarbas
# Recipe:: vscode
#
# Copyright:: 2019, The Authors, All Rights Reserved.

homebrew_cask 'visual-studio-code' do
  only_if [ node['platform'] == 'mac_os_x' ]
end

jarbas_yay_package 'visual-studio-code-bin' do
  not_if [ node['platform'] == 'mac_os_x' ]
end

node['jarbas']['vscode']['extensions'].each do |e|
  jarbas_execute "install_vscode_extension[#{e}]" do
    command "code --install-extension #{e}"
    not_if "code --list-extensions |grep #{e}"
  end
end
