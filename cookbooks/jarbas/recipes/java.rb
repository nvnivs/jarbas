homebrew_tap 'adoptopenjdk/openjdk' do
only_if { node['platform'] == 'mac_os_x' }
end

case node['platform']
when 'mac_os_x'
  homebrew_cask 'adoptopenjdk11'
else
  raise 'Unsupported platform'
end
