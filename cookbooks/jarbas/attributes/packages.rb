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
  'wget', # Internet file retriever
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
  'coreutils', # GNU File, Shell, and Text utilities
  'jq', # Lightweight and flexible command-line JSON processor
  'telnet',          # User interface to the TELNET protocol (built from macOS Sierra sources)
  'tcptraceroute',   # Traceroute implementation using TCP packets
  'watch',           # Executes a program periodically, showing output fullscreen
  'yamllint',        # Linter for YAML files
]

# Homebrew taps for mac_os_x
default['jarbas']['packages']['homebrew_taps'] = [
  'homebrew/cask',
  'homebrew/cask-versions',
  'heroku/brew',
]

default['jarbas']['packages']['homebrew_untap'] = [
  'heroku/heroku',
]

# Homebrew casks for mac_os_x
# Available casks at https://github.com/Homebrew/homebrew-cask/tree/master/Casks
default['jarbas']['packages']['homebrew_casks'] = [
  'gpg-suite', # encrypt, decrypt, sign and verify files or messages
  'rectangle', # Rectangle is a window management app based on Spectacle, written in Swift.
]
