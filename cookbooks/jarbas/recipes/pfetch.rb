git "#{node['jarbas']['repos']}/pfetch" do
  repository  'https://github.com/dylanaraps/pfetch'
  action      :checkout
  user        node['jarbas']['user']
end
