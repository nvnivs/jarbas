default['jarbas']['home']  = Dir.home
default['jarbas']['user']  = 'root'
default['jarbas']['repos'] = "#{node['jarbas']['home']}/repos"

# Additional recipes to run on a node.
default['jarbas']['recipes'] = [
]
