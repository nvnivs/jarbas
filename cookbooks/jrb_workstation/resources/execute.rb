property :command, String, required: true
property :name, String, name_property: true

action :run do
  execute   new_resource.name do
    command new_resource.command
    user    node['jrb_workstation']['user']
    cwd     node['jrb_workstation']['home']
    environment(
      'HOME' => node['jrb_workstation']['home'],
      'USER' => node['jrb_workstation']['user']
    )
  end
end

action :nothing do
end
