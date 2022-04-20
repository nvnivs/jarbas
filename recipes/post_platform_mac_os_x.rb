#
# Cookbook:: jarbas
# Recipe:: platform_mac_os_x_post
#
# Copyright:: 2021, The Authors, All Rights Reserved.

ruby_block 'Enable admin password prompt' do
  block do
    sudoers = Chef::Util::FileEdit.new('/etc/sudoers')
    sudoers.search_file_replace_line(/^\%admin  ALL=\(ALL\) NOPASSWD: ALL$/,
      '%admin  ALL=(ALL) ALL')
    sudoers.write_file
  end
end
