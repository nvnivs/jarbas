name 'workstation'
description 'Provisions and configures a workstation'

base_run_list = [
  'recipe[jrb_workstation]'
]

run_list(base_run_list)

env_run_lists(
  '_default' => [],
  'macbook' => base_run_list + [
    'recipe[jrb_workstation::brew]',
    'recipe[jrb_workstation::brew_cask]'
  ]
)
