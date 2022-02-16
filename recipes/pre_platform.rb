#
# Cookbook:: jarbas
# Recipe:: pre_platform
#
# Copyright:: 2019, The Authors, All Rights Reserved.

include_recipe "jarbas::pre_platform_#{node['platform']}"
