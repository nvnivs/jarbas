#
# Cookbook:: jarbas
# Recipe:: platform_mac_os_x_post
#
# Copyright:: 2021, The Authors, All Rights Reserved.

jarbas_execute 'softwareupdate' do
  command           'softwareupdate --all --install --force'
  live_stream       true
  guard_interpreter :bash
  not_if            'softwareupdate -l 2> >(grep -F "No new software available.")'
end

jarbas_execute 'brew upgrade' do
  command     'brew upgrade'
  live_stream true
  not_if      'exit $(brew outdated| wc -l)'
end

ruby_block 'Enable admin password prompt' do
  block do
    sudoers = Chef::Util::FileEdit.new('/etc/sudoers')
    sudoers.search_file_replace_line(/^\%admin  ALL=\(ALL\) NOPASSWD: ALL$/,
      '%admin  ALL=(ALL) ALL')
    sudoers.write_file
  end
end
