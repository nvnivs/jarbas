property :name, String, name_property: true

action :upgrade do
    package new_resource.name do
        action :upgrade
        not_if { node['platform'] == 'manjaro' }
      end
      
      pacman_package new_resource.name do
        action  :upgrade
        only_if { node['platform'] == 'manjaro' }
      end      
end