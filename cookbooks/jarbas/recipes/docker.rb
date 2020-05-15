#
# Cookbook:: jarbas
# Recipe:: docker
#
# Copyright:: 2019, The Authors, All Rights Reserved.

package 'docker' do
  action :upgrade
end

#TODO: Package throwing a 404 in aur
package 'kubernetes-cli' do
  action :upgrade
end

# Stern makes Kubernetes log watching easier
package 'stern' do
  action :upgrade
end

package 'helm' do
  action :upgrade
end

package 'aws-iam-authenticator' do
  action :upgrade
end

package 'minikube' do
  action :upgrade
end

jarbas_execute 'minikube[cpus]' do
  command 'minikube config set cpus 4'
  not_if 'minikube config get cpus |grep "^4$"'
end

#jarbas_execute 'minikube[dashboard]' do
#  command 'minikube config set dashboard true'
#  not_if 'minikube config get dashboard |grep "^true$"'
#end

jarbas_execute 'minikube[kubernetes-version]' do
  command 'minikube config set kubernetes-version 1.15.0'
  not_if 'minikube config get kubernetes-version |grep "^1\.15\.0$"'
end

jarbas_execute 'minikube[memory]' do
  command 'minikube config set memory 6048'
  not_if 'minikube config get memory |grep "^6048$"'
end
