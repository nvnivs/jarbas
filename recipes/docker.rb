#
# Cookbook:: jarbas
# Recipe:: docker
#
# Copyright:: 2019, The Authors, All Rights Reserved.

# Docker
services = ['docker.service', 'containerd.service']

if platform?('mac_os_x')
  homebrew_cask 'docker'
  services = ['docker']
elsif platform?('ubuntu')
  docker_installation 'default'
else
  jarbas_package 'docker'
end

# Manage docker as user
group 'docker' do
  members  [ node['jarbas']['user'] ]
  notifies :run, 'jarbas_execute[reload_docker_group]', :immediately
end

jarbas_execute 'reload_docker_group' do
  command 'newgrp docker'
  action  :nothing
  not_if  { platform?('mac_os_x') }
end

# Configure services to start on boot
services.each do |s|
  service s do
    action [ :enable, :start ]
  end
end

# Helm
jarbas_package 'helm' do
  not_if { platform?('ubuntu') }
end

snap_package 'helm' do
  options 'classic'
  action  :upgrade
  only_if { platform?('ubuntu') }
end

# Kubectl
if platform?('mac_os_x')
  package 'kubernetes-cli'
else
  jarbas_yay_package 'kubectl-bin' do
    not_if { platform?('ubuntu') }
  end  
end

snap_package 'kubectl' do
  options 'classic'
  action  :upgrade
  only_if { platform?('ubuntu') }
end

# Stern: Multi pod and container log tailing for Kubernetes
if platform?('mac_os_x')
  package 'stern'
else
  jarbas_yay_package 'stern-bin' do
    not_if { platform?('ubuntu') }
  end
end

# AWS IAM Authenticator: A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster
if platform?('mac_os_x')
  package 'aws-iam-authenticator'
else
  jarbas_yay_package 'aws-iam-authenticator-bin' do
    not_if { platform?('ubuntu') }
  end
end
