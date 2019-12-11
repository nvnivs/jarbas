#
# Cookbook:: jrb_workstation
# Recipe:: kubernetes
#
# Copyright:: 2019, The Authors, All Rights Reserved.

package 'kubernetes-cli' do
  action :upgrade
end

package 'kubernetes-helm' do
  version 'v2.12.2'
end

package 'aws-iam-authenticator' do
  action :upgrade
end

package 'minikube' do
  action :upgrade
end

jrb_workstation_execute 'minikube[cpus]' do
  command 'minikube config set cpus 4'
  not_if 'minikube config get cpus |grep "^4$"'
end

#jrb_workstation_execute 'minikube[dashboard]' do
#  command 'minikube config set dashboard true'
#  not_if 'minikube config get dashboard |grep "^true$"'
#end

jrb_workstation_execute 'minikube[kubernetes-version]' do
  command 'minikube config set kubernetes-version 1.15.0'
  not_if 'minikube config get kubernetes-version |grep "^1\.15\.0$"'
end

jrb_workstation_execute 'minikube[memory]' do
  command 'minikube config set memory 6048'
  not_if 'minikube config get memory |grep "^6048$"'
end
