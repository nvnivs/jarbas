homebrew_tap 'adoptopenjdk/openjdk' do
  only_if { platform?('mac_os_x') }
end

if platform?('mac_os_x')
  homebrew_cask 'adoptopenjdk11'
else
  raise 'Unsupported platform'
end
