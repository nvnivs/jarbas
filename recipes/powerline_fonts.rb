#
# Cookbook:: jarbas
# Recipe:: powerline_fonts
#
# Copyright:: 2019, The Authors, All Rights Reserved.

include_recipe 'jarbas::git'

git "#{node['jarbas']['home']}/fonts" do
  repository 'https://github.com/powerline/fonts.git'
  action     :checkout
  depth      1
  user       node['jarbas']['user']
  notifies   :run, 'jarbas_execute[install_fonts]', :immediately
end

jarbas_execute 'install_fonts' do
  command "#{node['jarbas']['home']}/fonts/install.sh"
  action  :nothing
end
