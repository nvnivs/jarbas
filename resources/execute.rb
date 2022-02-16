property :command, String, required: true
property :live_stream, [true, false], default: false
property :cwd, String, required: false, default: node['jarbas']['home']
unified_mode true

action :run do
  execute   new_resource.name do
    command      new_resource.command
    user         node['jarbas']['user']
    cwd          new_resource.cwd
    live_stream  new_resource.live_stream
    environment(
      'HOME' => node['jarbas']['home'],
      'USER' => node['jarbas']['user']
    )
  end
end
