#
# Cookbook:: workstation
# Recipe:: brew
#
# Copyright:: 2019, The Authors, All Rights Reserved.

include_recipe 'homebrew::default'

homebrew_tap 'caskroom/cask'
homebrew_tap 'caskroom/versions'
homebrew_tap 'chef/chef'

packages = [
  'ansible',         # Automate deployment, configuration, and upgrading
  'autossh',         # Automatically restart SSH sessions and tunnels
  'coreutils',       # GNU File, Shell, and Text utilities
  'golang',          # Open source programming language to build simple/reliable/efficient software
  'jq',              # Lightweight and flexible command-line JSON processor
  'lynx',            # Text-based web browser
  'kubernetes-helm', # The Kubernetes package manager
  'mtr',             # 'traceroute' and 'ping' in a single tool
  'pandoc',          # Swiss-army knife of markup format conversion
  'pass',            # Password manager
  'python',          # Interpreted, interactive, object-oriented programming language
  'python3',         # Interpreted, interactive, object-oriented programming language
  'portaudio',       # Required for libspotify
  'qemu',            # x86 and PowerPC Emulator
  'ranger',          # File browser
  'telnet',          # User interface to the TELNET protocol (built from macOS Sierra sources)
  'tree',            # Display directories as trees (with optional color/HTML output)
  'vim',             # Vi 'workalike' with many additional features
  'watch',           # Executes a program periodically, showing output fullscreen
]

packages.each do |p|
  homebrew_package p do
    action :upgrade
  end
end

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
  'p4v',                           # Perforce
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

# Upgrade for htop is failing with "already installed"
homebrew_package 'htop'

# Upgrade for tcptraceroute is failing with "Error: tcptraceroute 1.5beta7_1 already installed"
homebrew_package 'tcptraceroute'

# Upgrade fails with "Error: wget 1.20.3_1 already installed"
homebrew_package 'wget'
homebrew_package 'terraform' do
  action :upgrade
  version '0.11.1' # Version is being blatantly ignored :(
end
