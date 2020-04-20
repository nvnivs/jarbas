# List of default packages to install or upgrade
default['jrb_workstation']['packages']['upgrade'] = [
  'autossh',         # Automatically restart SSH sessions and tunnels
  'iftop',           # Display bandwidth usage on an interface
  'openssh',
  'openssl',
  'pass',            # Password manager
  'tree',            # Display directories as trees (with optional color/HTML output)
  'unzip',
  'zip'
]

# List of default packages to install (no upgrade support)
default['jrb_workstation']['packages']['install'] = [
  'htop',             # Improved top (interactive process viewer)
  'mtr',
  'tcptraceroute',    # Traceroute implementation using TCP packets
  'wget',             # Internet file retriever
]

# List of arch only packages
default['jrb_workstation']['packages']['arch'] = [
  'alsa-utils',       # An alternative implementation of Linux sound support
  'pulseaudio',       # Proxy for sound hardware
  'iotop',            # View I/O usage of processes
]

# Homebrew packages for mac_ox_x
default['jrb_workstation']['packages']['homebrew'] = [
  'coreutils',       # GNU File, Shell, and Text utilities
  'golang',          # Open source programming language to build simple/reliable/efficient software
  'gptfdisk',        # Text-mode partitioning tools
  'jq',              # Lightweight and flexible command-line JSON processor
  'lynx',            # Text-based web browser
  'pandoc',          # Swiss-army knife of markup format conversion
  'portaudio',       # Required for libspotify
  'qemu',            # x86 and PowerPC Emulator
  'telnet',          # User interface to the TELNET protocol (built from macOS Sierra sources)
  'watch',           # Executes a program periodically, showing output fullscreen
  'yamllint',        # Linter for YAML files
]
