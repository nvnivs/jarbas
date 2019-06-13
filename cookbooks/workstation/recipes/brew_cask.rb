#
# Cookbook:: workstation
# Recipe:: brew_cask
#
# Copyright:: 2019, The Authors, All Rights Reserved.

homebrew_tap 'caskroom/cask'
homebrew_tap 'caskroom/versions'
homebrew_tap 'chef/chef'

# Available casks at https://github.com/Homebrew/homebrew-cask/tree/master/Casks
casks = [
  'android-file-transfer',         # Android File Transfer
  'blue-jeans',                    # Video conferencing (TODO: does not auto install)
  'caffeine',                      # Prevents sleep
  'chefdk',
  'docker',
  # evernote
  # firefox                       # Firefox (TODO: would rather have dev edition but can find it on brew)
  'google-chrome',
  'gpg-suite',                     # encrypt, decrypt, sign and verify files or messages
  # iterm2                        # Terminal
  'java8',                         # Java Standard Edition Development Kit
  # microsoft-remote-desktop-beta
  'minikube',                      # Minikube is a tool that makes it easy to run Kubernetes locally.
  'mysql-shell',
  # 'p4v',                           # Perforce SHASUM failures
  # slack
  # spotify
  # tunnelblick                   # VPN client
  'vagrant',
  'virtualbox',
  'visual-studio-code',
]

casks.each do |c|
  homebrew_cask c
end

execute 'homebrew_upgrade_all_casks' do
  command 'brew cask upgrade'
  user Homebrew.owner
  environment ({ 'HOME' => ::Dir.home(Homebrew.owner), 'USER' => Homebrew.owner })
  cwd ::Dir.home(Homebrew.owner)
end

