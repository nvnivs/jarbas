jarbas_aur 'heroku-cli' do
  action [ :build, :install ]
  only_if { node['platform'] == 'arch'}
end

homebrew_package "heroku" do
  action  :upgrade
  only_if { node['platform'] == 'mac_os_x' }
end
