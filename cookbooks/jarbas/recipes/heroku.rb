jarbas_yay_package 'heroku-cli-bin' do
  not_if { node['platform'] == 'mac_os_x' }
end

homebrew_package "heroku" do
  action  :upgrade
  only_if { node['platform'] == 'mac_os_x' }
end
