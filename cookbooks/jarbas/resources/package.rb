

action :install do
  case node['platform']
  when 'mac_os_x', 'arch'
    package new_resource.name
  when 'manjaro'
    pacman_package new_resource.name
  else
    raise 'Unsupported platform'
  end
end
