unified_mode true

action :install do
  jarbas_execute "vscode_extension[#{new_resource.name}]" do
    command "code --install-extension #{new_resource.name}"
    not_if  "code --list-extensions |grep #{new_resource.name}", 
      user: node['jarbas']['user'],
      environment: {
        'HOME' => node['jarbas']['home'],
        'USER' => node['jarbas']['user']
      }
  end
end
