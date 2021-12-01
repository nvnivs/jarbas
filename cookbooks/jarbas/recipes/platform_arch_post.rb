#
# Cookbook:: jarbas
# Recipe:: platform_arch_post
#
# Copyright:: 2020, The Authors, All Rights Reserved.

execute 'Pacman update' do
    command     'pacman -Syu --noconfirm'
    live_stream true
end

execute 'Pacman clean' do
    command     'pacman -Sc --noconfirm'
    live_stream true
end

execute 'Yay update' do
    command     'yay -Syu --builddir=/tmp/ --noconfirm'
    live_stream true
end

execute 'Yay clean' do
    command     'yay -Sc --noconfirm'
    live_stream true
end

#TODO: Reboot, play with this:
# [[ $(pacman -Q linux | cut -d " " -f 2) > $(uname -r) ]] && echo reboot