#
# Cookbook:: jarbas
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

# Pre-platform
include_recipe 'jarbas::pre_platform'

# Base recipes
include_recipe 'jarbas::git'
include_recipe 'jarbas::zsh'
include_recipe 'jarbas::bash'
include_recipe 'jarbas::vim'
include_recipe 'jarbas::ranger'
include_recipe 'jarbas::urxvt'
include_recipe 'jarbas::packages'
include_recipe 'jarbas::chef' if node['jarbas']['chef']['install']
include_recipe 'jarbas::python'
include_recipe 'jarbas::vpn'

# Node recipes
node['jarbas']['recipes'].each do |r|
  include_recipe "jarbas::#{r}"
end

# Post-platform
include_recipe 'jarbas::post_platform'
