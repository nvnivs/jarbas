name 'workstation'
description 'Provisions and configures a workstation'

base_run_list = [
  'recipe[workstation]'
]

run_list(base_run_list)

env_run_lists(
  '_default' => [],
  'macbook' => base_run_list + [
    'recipe[workstation::brew]'
  ]
)
