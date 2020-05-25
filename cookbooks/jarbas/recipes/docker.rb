#
# Cookbook:: jarbas
# Recipe:: docker
#
# Copyright:: 2019, The Authors, All Rights Reserved.

package 'docker' do
  action :upgrade
end

jarbas_aur 'kubectl-bin' do
  action  [ :build, :install ]
  only_if { node['platform'] == 'arch'}
end

# Kubectl
package 'kubernetes-cli' do
  action  :upgrade
  only_if { node['platform'] == 'mac_os_x' }
end

# Stern makes Kubernetes log watching easier
#TODO: No package available in arch, will need to build
package 'stern' do
  action  :upgrade
  only_if { node['platform'] == 'mac_os_x' }
end

package 'helm' do
  action :upgrade
end

# AWS IAM Authenticator
#TODO: Installation failing
#jarbas_aur 'aws-iam-authenticator-git'  do
#  action  [ :build, :install ]
#  only_if { node['platform'] == 'arch'}
#end

package 'aws-iam-authenticator' do
  action  :upgrade
  only_if { node['platform'] == 'mac_os_x' }
end

package 'minikube' do
  action :upgrade
end

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
