unified_mode true

action :install do
  execute "yay -S #{new_resource.name}" do
    command "yay -S --noconfirm --noprogressbar --builddir=/var/cache/yay #{new_resource.name}"
    not_if "yay -Q |grep #{new_resource.name}"
  end
end
