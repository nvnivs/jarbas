#
# Cookbook:: jarbas
# Recipe:: docker
#
# Copyright:: 2019, The Authors, All Rights Reserved.

# Docker
if platform?('mac_os_x')
  homebrew_cask 'docker'
else
  jarbas_package 'docker'
end

# Manage docker as user
group 'docker' do
  members  [ node['jarbas']['user'] ]
  notifies :run, 'jarbas_execute[reload_group]', :immediately
end

jarbas_execute 'reload_group' do
  command 'newgrp docker'
  action  :nothing
  not_if  { platform?('mac_os_x') }
end

# Configure Docker to start on boot
service 'docker.service' do
  action [ :enable, :start ]
end

service 'containerd.service' do
  action [ :enable, :start ]
end

# Helm
jarbas_package 'helm'

# Kubectl
if platform?('mac_os_x')
  package 'kubernetes-cli'
else
  jarbas_yay_package 'kubectl-bin'
end

# Stern: Multi pod and container log tailing for Kubernetes
if platform?('mac_os_x')
  package 'stern'
else
  jarbas_yay_package 'stern-bin'
end

# AWS IAM Authenticator: A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster
if platform?('mac_os_x')
  package 'aws-iam-authenticator'
else
  jarbas_yay_package 'aws-iam-authenticator-bin'
end

# Minikube
jarbas_package 'minikube'

# TODO: this stuff is too much for the crap laptop
# jarbas_execute 'minikube[cpus]' do
#  command 'minikube config set cpus 4'
#  not_if 'minikube config get cpus |grep "^4$"'
# end

# jarbas_execute 'minikube[dashboard]' do
#  command 'minikube config set dashboard true'
#  not_if 'minikube config get dashboard |grep "^true$"'
# end

# jarbas_execute 'minikube[kubernetes-version]' do
#  command 'minikube config set kubernetes-version 1.15.0'
#  not_if 'minikube config get kubernetes-version |grep "^1\.15\.0$"'
# end

# jarbas_execute 'minikube[memory]' do
#  command 'minikube config set memory 6048'
#  not_if 'minikube config get memory |grep "^6048$"'
# end
