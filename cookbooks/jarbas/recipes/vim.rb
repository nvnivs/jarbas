#
# Cookbook:: jarbas
# Recipe:: vim
#
# Copyright:: 2019, The Authors, All Rights Reserved.

user = node['jarbas']['user']

package 'vim' do
  action :upgrade
end

remote_directory "#{node['jarbas']['home']}/.vim" do
  source      'vim'
  owner       user
  files_owner user
end

directory "#{node['jarbas']['home']}/.vim/autoload" do
  owner     user
end


remote_file "#{node['jarbas']['home']}/.vim/autoload/plug.vim" do
  source    'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  notifies  :run, 'jarbas_execute[vim_plug_upgrade]', :immediately
  owner     user
end

jarbas_execute 'vim_plug_upgrade' do
  command   'vim -esu ~/.vim/vimrc +PlugUpgrade +qa || true'
  action    :nothing
  notifies  :run, 'jarbas_execute[vim_plug_clean_update]', :immediately
end

jarbas_execute 'vim_plug_clean_update' do
  command   'vim -esu ~/.vim/vimrc +PlugClean! +PlugUpdate +qa || true'
  action    :nothing
end
