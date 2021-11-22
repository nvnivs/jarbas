#
# Cookbook:: jarbas
# Recipe:: docker
#
# Copyright:: 2019, The Authors, All Rights Reserved.

# Docker
jarbas_package 'docker' do
  action :upgrade
end

# Helm
jarbas_package 'helm' do
  action :upgrade
end

# Kubectl
jarbas_yay_package 'kubectl-bin' do
  not_if { node['platform'] == 'mac_os_x' }
end

package 'kubernetes-cli' do
  action  :upgrade
  only_if { node['platform'] == 'mac_os_x' }
end

# Stern: Multi pod and container log tailing for Kubernetes
jarbas_yay_package 'stern-bin' do
  not_if { node['platform'] == 'mac_os_x' }
end

package 'stern' do
  action  :upgrade
  only_if { node['platform'] == 'mac_os_x' }
end

# AWS IAM Authenticator: A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster
jarbas_yay_package 'aws-iam-authenticator-bin' do
  not_if { node['platform'] == 'mac_os_x' }
end

package 'aws-iam-authenticator' do
  action  :upgrade
  only_if { node['platform'] == 'mac_os_x' }
end

# Minikube
jarbas_package 'minikube'

#TODO: this stuff is too much for the crap laptop
#jarbas_execute 'minikube[cpus]' do
#  command 'minikube config set cpus 4'
#  not_if 'minikube config get cpus |grep "^4$"'
#end

#jarbas_execute 'minikube[dashboard]' do
#  command 'minikube config set dashboard true'
#  not_if 'minikube config get dashboard |grep "^true$"'
#end

#jarbas_execute 'minikube[kubernetes-version]' do
#  command 'minikube config set kubernetes-version 1.15.0'
#  not_if 'minikube config get kubernetes-version |grep "^1\.15\.0$"'
#end

#jarbas_execute 'minikube[memory]' do
#  command 'minikube config set memory 6048'
#  not_if 'minikube config get memory |grep "^6048$"'
#end
