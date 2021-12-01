# List of default packages to install or upgrade
default['jarbas']['packages']['install'] = [
  'autossh',         # Automatically restart SSH sessions and tunnels
  'htop',            # Improved top (interactive process viewer)
  'iftop',           # Display bandwidth usage on an interface
  'mtr',
  'openssh',
  'openssl',
  'pass',            # Password manager
  'tree',            # Display directories as trees (with optional color/HTML output)
  'unzip',
  'zip',
  'wget',             # Internet file retriever
]

# List of arch/manjaro only packages
default['jarbas']['packages']['arch'] = [
  'iotop',            # View I/O usage of processes
  'ntp',              # Software clock syncronizer
  'pulseaudio',       # Proxy for sound hardware
  'qt5-webkit',
  'qt5-x11extras',
  'qt5-quickcontrols',
]

# List of arch only AUR packages
default['jarbas']['packages']['aur'] = [
]


# Homebrew packages for mac_ox_x
default['jarbas']['packages']['homebrew'] = [
  'coreutils',       # GNU File, Shell, and Text utilities
#  'gptfdisk',        # Text-mode partitioning tools
  'jq',              # Lightweight and flexible command-line JSON processor
#  'lynx',            # Text-based web browser
#  'pandoc',          # Swiss-army knife of markup format conversion
#  'portaudio',       # Required for libspotify
#  'qemu',            # x86 and PowerPC Emulator
  'telnet',          # User interface to the TELNET protocol (built from macOS Sierra sources)
  'tcptraceroute',   # Traceroute implementation using TCP packets
  'watch',           # Executes a program periodically, showing output fullscreen
  'yamllint',        # Linter for YAML files
 # 'ytop',            # A TUI system monitor written in Rust
]

# Homebrew taps for mac_os_x
default['jarbas']['packages']['homebrew_taps'] = [
  'homebrew/cask',
  'homebrew/cask-versions',
  'chef/chef',
#  'cjbassi/ytop',
  'heroku/brew',
]

default['jarbas']['packages']['homebrew_untap'] = [
  'heroku/heroku',
]

# Homebrew casks for mac_os_x
# Available casks at https://github.com/Homebrew/homebrew-cask/tree/master/Casks
default['jarbas']['packages']['homebrew_casks'] = [
#  'android-file-transfer',          # Android File Transfer
#  'chef/chef/chefdk',
#  'caskroom/versions/firefox-developer-edition',
#  'google-chrome',
  'gpg-suite',                      # encrypt, decrypt, sign and verify files or messages
#  'java',                           # Java Standard Edition Development Kit
#  'microsoft-remote-desktop-beta',
#  'mysql-shell',
#  'p4v',                            # Perforce SHASUM failures
  'rectangle',                      # Rectangle is a window management app based on Spectacle, written in Swift.
#  'spotify',
#  'virtualbox',
]
