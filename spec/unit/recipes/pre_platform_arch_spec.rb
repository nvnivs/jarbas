#
# Cookbook:: jarbas
# Spec:: pre_platform_arch
#
# Copyright:: 2022, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'jarbas::pre_platform_arch' do
  context 'when no packages need update' do
    it 'does not execute pacman update' do
      stub_command('checkupdates').and_return(false)
      stub_command('[[ $(yay -Qu |wc -l) == 0 ]]').and_return(false)

      expect(chef_run).not_to run_execute('pacman -Syyu --noconfirm')
      expect(chef_run).not_to run_execute('yay -Syu --builddir=/tmp/ --noconfirm')
    end
  end

  context 'when pacman needs update' do
    it 'executes pacman update' do
      stub_command('checkupdates').and_return(true)
      stub_command('[[ $(yay -Qu |wc -l) == 0 ]]').and_return(false)

      expect(chef_run).to run_execute('pacman -Syyu --noconfirm')
      expect(chef_run).not_to run_execute('yay -Syu --builddir=/tmp/ --noconfirm')
    end
  end

  context 'when yay needs update' do
    it 'executes yay update' do
      stub_command('checkupdates').and_return(false)
      stub_command('[[ $(yay -Qu |wc -l) == 0 ]]').and_return(true)

      expect(chef_run).not_to run_execute('pacman -Syyu --noconfirm')
      expect(chef_run).to run_execute('yay -Syu --builddir=/tmp/ --noconfirm')
    end
  end
end
