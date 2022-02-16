#
# Cookbook:: jarbas
# Recipe:: post_platform
#
# Copyright:: 2019, The Authors, All Rights Reserved.

include_recipe "jarbas::post_platform_#{node['platform']}"
