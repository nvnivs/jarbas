#
# Cookbook:: jarbas
# Spec:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'jarbas::default' do
  context 'When all attributes are default, on Arch' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'arch'

    it 'converges successfully' do
      # Arch guards      
      stub_command('checkupdates').and_return(false)
      stub_command('yay -Qu |wc -l').and_return(0)

      # Python guards
      stub_command('pip3 list |grep pytest').and_return(true)
      stub_command('pip3 list |grep tox').and_return(true)
      stub_command('pip3 list |grep pre-commit').and_return(true)

      expect { chef_run }.to_not raise_error
    end
  end
end
