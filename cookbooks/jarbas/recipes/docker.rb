#
# Cookbook:: jarbas
# Recipe:: docker
#
# Copyright:: 2019, The Authors, All Rights Reserved.

# Docker
if node['platform'] == 'mac_os_x' then
  homebrew_cask 'docker'
else
  jarbas_package 'docker'
end

# Helm
jarbas_package 'helm'

# Kubectl
case node['platform']
when 'mac_os_x'
  package 'kubernetes-cli'
else
  jarbas_yay_package 'kubectl-bin'
end

# Stern: Multi pod and container log tailing for Kubernetes
case node['platform']
when 'mac_os_x'
  package 'stern'
else
  jarbas_yay_package 'stern-bin'
end

# AWS IAM Authenticator: A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster
case node['platform']
when 'mac_os_x'
  package 'aws-iam-authenticator'
else
  jarbas_yay_package 'aws-iam-authenticator-bin'
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
