# Available casks at https://github.com/Homebrew/homebrew-cask/tree/master/Casks
default['jrb_workstation']['brew']['casks'] = [
  'android-file-transfer',         # Android File Transfer
  'chef/chef/chefdk',
  'cyberduck',                     # FTP client
  'docker',                        # NOTE: need to open with `open /Applications/Docker.app` to authorize
  'caskroom/versions/firefox-developer-edition',
  'google-chrome',
  'gpg-suite', # encrypt, decrypt, sign and verify files or messages
  'java', # Java Standard Edition Development Kit
  'microsoft-remote-desktop-beta',
  'mysql-shell',
  'p4v', # Perforce SHASUM failures
  'rectangle', # Rectangle is a window management app based on Spectacle, written in Swift.
  'slack',
  'spotify',
  'virtualbox',
]

default['jrb_workstation']['brew']['casks_blacklist'] = [
  'caffeine',
]

default['jrb_workstation']['brew']['packages'] = [
  'ansible',         # Automate deployment, configuration, and upgrading
  'autossh',         # Automatically restart SSH sessions and tunnels
  'coreutils',       # GNU File, Shell, and Text utilities
  'golang',          # Open source programming language to build simple/reliable/efficient software
  'gptfdisk',        # Text-mode partitioning tools
  'jq',              # Lightweight and flexible command-line JSON processor
  'lynx',            # Text-based web browser
  'pandoc',          # Swiss-army knife of markup format conversion
  'pass',            # Password manager
  'portaudio',       # Required for libspotify
  'qemu',            # x86 and PowerPC Emulator
  'telnet',          # User interface to the TELNET protocol (built from macOS Sierra sources)
  'tree',            # Display directories as trees (with optional color/HTML output)
  'watch',           # Executes a program periodically, showing output fullscreen
  'yamllint',        # Linter for YAML files
]

default['jrb_workstation']['brew']['taps'] = [
  'caskroom/cask',
  'caskroom/versions',
  'chef/chef',
]

default['jrb_workstation']['brew']['taps_blacklist'] = [
  'homebrew/cask-versions',
]
