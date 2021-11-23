name 'jarbas'
maintainer 'n'
maintainer_email 'nvnivs@gmail.com'
license 'All Rights Reserved'
description 'Installs/Configures workstation'
long_description 'Installs/Configures workstation'
version '4.26.0'

chef_version '>= 15.14' if respond_to?(:chef_version)
issues_url 'https://github.com/z0c/jarbas/issues'
source_url 'https://github.com/z0c/jarbas'

depends 'chef_client_updater',  '~> 3.9'
depends 'homebrew',             '~> 5.0'
depends 'macos',                '~> 3.2'
depends 'vagrant',              '~> 2.0'

supports 'arch'
supports 'mac_os_x'
supports 'manjaro'