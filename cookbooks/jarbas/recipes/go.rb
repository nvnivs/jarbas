package 'go-pie' do
  not_if { node['platform'] == 'mac_os_x' }
end
