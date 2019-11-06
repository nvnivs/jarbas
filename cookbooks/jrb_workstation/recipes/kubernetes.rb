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

homebrew_cask 'minikube'
