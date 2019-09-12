name 'jrb_workstation'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'All Rights Reserved'
description 'Installs/Configures workstation'
long_description 'Installs/Configures workstation'
version '2.35.0'
chef_version '>= 12.14' if respond_to?(:chef_version)
# issues_url 'https://github.com/<insert_org_here>/jrb_workstation/issues'
# source_url 'https://github.com/<insert_org_here>/jrb_workstation'

depends 'homebrew'
depends 'macos'
depends 'vagrant'
