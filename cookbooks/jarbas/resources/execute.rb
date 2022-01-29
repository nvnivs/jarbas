property :command, String, required: true

property :live_stream, [true, false], default: false

action :run do
  execute   new_resource.name do
    command     new_resource.command
    user        node['jarbas']['user']
    cwd         node['jarbas']['home']
    live_stream new_resource.live_stream
    environment(
      'HOME' => node['jarbas']['home'],
      'USER' => node['jarbas']['user']
    )
  end
end
