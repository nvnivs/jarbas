# List of default os packages to install or upgrade
default['jrb_workstation']['packages']['upgrade'] = [
  'tree',            # Display directories as trees (with optional color/HTML output)
]

# List of default os packages to install (no upgrade support)
default['jrb_workstation']['packages']['install'] = [
  'htop',             # Improved top (interactive process viewer)
  'mtr',
  'wget',             # Internet file retriever
]
