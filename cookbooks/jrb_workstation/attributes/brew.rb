# Available casks at https://github.com/Homebrew/homebrew-cask/tree/master/Casks
default['jrb_workstation']['brew']['casks'] = [
  'android-file-transfer',         # Android File Transfer
  'blue-jeans',                    # Video conferencing (TODO: does not auto install)
  'caffeine',                      # Prevents sleep
  'chef/chef/chefdk',
  'docker',
  # evernote
  # firefox                       # Firefox (TODO: would rather have dev edition but can find it on brew)
  'google-chrome',
  'gpg-suite', # encrypt, decrypt, sign and verify files or messages
  # iterm2                        # Terminal
  'java8', # Java Standard Edition Development Kit
  # microsoft-remote-desktop-beta
  'minikube', # Minikube is a tool that makes it easy to run Kubernetes locally.
  'mysql-shell',
  'p4v',                           # Perforce SHASUM failures
  'slack',
  # spotify
  # tunnelblick                   # VPN client
  'virtualbox',
  'visual-studio-code'
]

default['jrb_workstation']['brew']['packages'] = [
  'ansible',         # Automate deployment, configuration, and upgrading
  'autossh',         # Automatically restart SSH sessions and tunnels
  'coreutils',       # GNU File, Shell, and Text utilities
  'git',             # Distributed revision control system
  'golang',          # Open source programming language to build simple/reliable/efficient software
  'gptfdisk',        # Text-mode partitioning tools
  'jq',              # Lightweight and flexible command-line JSON processor
  'lynx',            # Text-based web browser
  'kubernetes-helm', # The Kubernetes package manager
  'mtr',             # 'traceroute' and 'ping' in a single tool
  'pandoc',          # Swiss-army knife of markup format conversion
  'pass',            # Password manager
  'portaudio',       # Required for libspotify
  'qemu',            # x86 and PowerPC Emulator
  'ranger',          # File browser
  'telnet',          # User interface to the TELNET protocol (built from macOS Sierra sources)
  'tree',            # Display directories as trees (with optional color/HTML output)
  'watch',           # Executes a program periodically, showing output fullscreen
]

default['jrb_workstation']['brew']['taps'] = [
  'caskroom/cask',
  'caskroom/versions',
  'chef/chef'
]

default['jrb_workstation']['brew']['taps_blacklist'] = [
  'homebrew/cask-versions'   
]
