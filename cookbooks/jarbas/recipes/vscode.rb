#
# Cookbook:: jarbas
# Recipe:: vscode
#
# Copyright:: 2019, The Authors, All Rights Reserved.

homebrew_cask 'visual-studio-code' do
  only_if [ node['platform'] == 'mac_os_x' ]
end

execute 'yaypackage[vscode]' do
  command 'yay -S --noconfirm --noprogressbar visual-studio-code-bin'
  not_if  [ node['platform'] == 'mac_os_x' ]
  not_if  'yay -Q |grep visual-studio-code-bin'
end

node['jarbas']['vscode']['extensions'].each do |e|
  jarbas_execute "install_vscode_extension[#{e}]" do
    command "code --install-extension #{e}"
    not_if "code --list-extensions |grep #{e}"
  end
end
