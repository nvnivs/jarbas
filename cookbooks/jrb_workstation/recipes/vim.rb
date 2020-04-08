#
# Cookbook:: jrb_workstation
# Recipe:: vim
#
# Copyright:: 2019, The Authors, All Rights Reserved.

user = node['jrb_workstation']['user']

package 'vim' do
  action :upgrade
end

remote_directory "#{node['jrb_workstation']['home']}/.vim" do
  source      'vim'
  owner       user
  files_owner user
end

directory "#{node['jrb_workstation']['home']}/.vim/autoload" do
  owner     user
end


remote_file "#{node['jrb_workstation']['home']}/.vim/autoload/plug.vim" do
  source    'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  notifies  :run, 'jrb_workstation_execute[vim_plug_upgrade]', :immediately
  owner     user
end

jrb_workstation_execute 'vim_plug_upgrade' do
  command   'vim -esu ~/.vim/vimrc +PlugUpgrade +qa || true'
  action    :nothing
  notifies  :run, 'jrb_workstation_execute[vim_plug_clean_update]', :immediately
end

jrb_workstation_execute 'vim_plug_clean_update' do
  command   'vim -esu ~/.vim/vimrc +PlugClean! +PlugUpdate +qa || true'
  action    :nothing
end
