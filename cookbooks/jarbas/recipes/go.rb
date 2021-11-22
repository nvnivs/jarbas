jarbas_package 'go-pie' do
  not_if { node['platform'] == 'mac_os_x' }
end

# Dependency manager
jarbas_package 'dep'
