property :command, String, required: true
property :name, String, name_property: true

action :run do
  execute   new_resource.name do
    command new_resource.command
    user    node['jarbas']['user']
    cwd     node['jarbas']['home']
    environment(
      'HOME' => node['jarbas']['home'],
      'USER' => node['jarbas']['user']
    )
  end
end

action :nothing do
end
