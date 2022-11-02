case node['platform']
when 'arch', 'manjaro'
  jarbas_yay_package 'google-cloud-sdk'
else
  raise 'Unsupported platform'
end
