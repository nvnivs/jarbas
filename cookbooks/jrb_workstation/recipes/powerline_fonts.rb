#
# Cookbook:: jrb_workstation
# Recipe:: powerline_fonts
#
# Copyright:: 2019, The Authors, All Rights Reserved.

git "#{node['jrb_workstation']['home']}/fonts" do
  repository 'https://github.com/powerline/fonts.git'
  action     :checkout
  depth      1
  user       node['jrb_workstation']['user']
  notifies   :run, "jrb_workstation_execute[install_fonts]", :immediately
end

jrb_workstation_execute 'install_fonts' do
  command "#{node['jrb_workstation']['home']}/fonts/install.sh"
  action  :nothing
end
