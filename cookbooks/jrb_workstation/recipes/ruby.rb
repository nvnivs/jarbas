#
# Cookbook:: jrb_workstation
# Recipe:: ruby
#
# Copyright:: 2019, The Authors, All Rights Reserved.

package 'ruby' do
  action :upgrade
end

# Required by RVM
package 'gpg2' do
  action :upgrade
end

execute 'install_rvm' do
  command 'curl -sSL https://get.rvm.io | bash -s stable'
  not_if 'which rvm'
  user Homebrew.owner
  environment ({ 'HOME' => ::Dir.home(Homebrew.owner), 'USER' => Homebrew.owner })
  cwd ::Dir.home(Homebrew.owner)
end

rubies = [
  'ruby-1.9.3-p551',
  'ruby-2.2.5',
  'ruby-2.5.5'
]

rubies.each do |version|
  execute "install_ruby[#{version}]" do
    command "rvm install #{version}"
    not_if "rvm list | grep -E #{version}"
    user Homebrew.owner
    environment ({ 'HOME' => ::Dir.home(Homebrew.owner), 'USER' => Homebrew.owner })
    cwd ::Dir.home(Homebrew.owner)
  end
end

execute 'set_default_ruby' do
  command 'rvm use 2.5.5 --default'
  not_if 'rvm list | grep -E "\* ruby-2.5.5"'
  user Homebrew.owner
  environment ({ 'HOME' => ::Dir.home(Homebrew.owner), 'USER' => Homebrew.owner })
  cwd ::Dir.home(Homebrew.owner)
end

gems = [
  'encrypt_data_bag'
]

gems.each do |g|
  execute "install_gem[#{g}]" do
    command "gem install #{g} --no-rdoc --no-ri"
    not_if "gem list | grep -E \"#{g}\""
    user Homebrew.owner
    environment ({ 'HOME' => ::Dir.home(Homebrew.owner), 'USER' => Homebrew.owner })
    cwd ::Dir.home(Homebrew.owner)
  end
end
