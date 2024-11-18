name 'jarbas'
maintainer 'n'
maintainer_email 'nvnivs@gmail.com'
license 'All Rights Reserved'
description 'Installs/Configures workstation'
version '5.17.0'

chef_version '>= 17.2'
issues_url 'https://github.com/z0c/jarbas/issues'
source_url 'https://github.com/z0c/jarbas'

# renovate: datasource=github-releases depName=sous-chefs/homebrew
depends 'homebrew', '5.4.9'
# renovate: datasource=github-releases depName=microsoft/macos-cookbook
depends 'macos', '5.1.0'
# renovate: datasource=github-releases depName=sous-chefs/vagrant
depends 'vagrant', '4.0.15'

supports 'arch'
supports 'mac_os_x'
supports 'manjaro'
