#
# Cookbook:: jrb_workstation
# Recipe:: vim
#
# Copyright:: 2019, The Authors, All Rights Reserved.

package 'vim' do
  action :upgrade
end

remote_directory "#{node['jrb_workstation']['home']}/.vim" do
  source 'vim'
end

directory "#{node['jrb_workstation']['home']}/.vim/autoload"

remote_file "#{node['jrb_workstation']['home']}/.vim/autoload/plug.vim" do
  source 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  notifies :run, 'execute[vim_plug_upgrade]', :immediately
end

execute 'vim_plug_upgrade' do
  command 'vim -esu ~/.vim/vimrc +PlugUpgrade +qa || true'
  action :nothing
  notifies :run, 'execute[vim_plug_clean_update]', :immediately
end

execute 'vim_plug_clean_update' do
  command 'vim -esu ~/.vim/vimrc +PlugClean! +PlugUpdate +qa || true'
  action :nothing
end
