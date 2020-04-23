git "#{node['jrb_workstation']['repos']}/pfetch" do
  repository  'https://github.com/dylanaraps/pfetch'
  action      :checkout
  user        node['jrb_workstation']['user']
end
