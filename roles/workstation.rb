name 'workstation'
description 'Provisions and configures a workstation'

common_run_list = [
  'recipe[jrb_workstation]'
]

run_list(common_run_list)

env_run_lists(
  '_default' => [],
  'macbook' => [
    'recipe[jrb_workstation::osx_sudoers_nopass]' ] +
    common_run_list +
    [
      'recipe[jrb_workstation::brew]',
      'recipe[jrb_workstation::brew_cask]',
      'recipe[jrb_workstation::osx_sudoers]'
    ]
)
