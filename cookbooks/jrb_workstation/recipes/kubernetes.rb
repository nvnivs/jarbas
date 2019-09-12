#
# Cookbook:: jrb_workstation
# Recipe:: kubernetes
#
# Copyright:: 2019, The Authors, All Rights Reserved.

package 'kubernetes-cli' do
  action :upgrade
end

package 'kubernetes-helm' do
  action :upgrade
  version 'v2.12.2'
end

package 'aws-iam-authenticator' do
  action :upgrade
end

jrb_workstation_execute 'homebrew_cask[minikube]' do
  command 'brew cask upgrade minikube'
end


