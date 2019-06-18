#
# Cookbook:: jrb_workstation
# Recipe:: brew
#
# Copyright:: 2019, The Authors, All Rights Reserved.

include_recipe 'homebrew::default'

packages = [
  'ansible',         # Automate deployment, configuration, and upgrading
  'autossh',         # Automatically restart SSH sessions and tunnels
  'coreutils',       # GNU File, Shell, and Text utilities
  'git',             # Distributed revision control system
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
  'watch',           # Executes a program periodically, showing output fullscreen
]

packages.each do |p|
  homebrew_package p do
    action :upgrade
  end
end

# Upgrade for htop is failing with "already installed"
homebrew_package 'htop'

# Upgrade for tcptraceroute is failing with "Error: tcptraceroute 1.5beta7_1 already installed"
homebrew_package 'tcptraceroute'

# Upgrade fails with "Error: wget 1.20.3_1 already installed"
homebrew_package 'wget'

# Terraform should have a fixed version, MAKE IT HAPPEN
# homebrew_package 'terraform' do
#  action :upgrade
#  version '0.11.11' # Version is being blatantly ignored :(
# end
