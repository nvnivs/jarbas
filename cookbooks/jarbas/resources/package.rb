property :name, String, name_property: true

action :install do
  case node['platform']
  when 'mac_os_x', 'arch'
    package new_resource.name do
      action :install
    end
  when 'manjaro'
    pacman_package new_resource.name do
      action  :install
    end 
  else
      raise 'Unsupported platform'
  end     
end