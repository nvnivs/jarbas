current_dir = File.absolute_path(File.dirname(__FILE__))

chef_repo_path          "#{current_dir}/.."
cookbook_path           "#{current_dir}/../berks-cookbooks"
node_path               '/tmp'
