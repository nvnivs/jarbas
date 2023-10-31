# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name 'jarbas'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list 'jarbas::default'

# Specify a custom source for a single cookbook:
cookbook 'jarbas', path: '.'

# Named run lists; Runs ad hoc recipes
named_run_list 'default', 'jarbas::default'
named_run_list 'aws', 'jarbas::pre_platform', 'jarbas::aws', 'jarbas::post_platform'
named_run_list 'chef', 'jarbas::pre_platform', 'jarbas::chef', 'jarbas::post_platform'
named_run_list 'docker', 'jarbas::pre_platform', 'jarbas::docker', 'jarbas::post_platform'
named_run_list 'gcloud', 'jarbas::pre_platform', 'jarbas::gcloud', 'jarbas::post_platform'
named_run_list 'i3', 'jarbas::i3'
named_run_list 'platform', 'jarbas::pre_platform', 'jarbas::post_platform'
named_run_list 'python', 'jarbas::pre_platform', 'jarbas::python', 'jarbas::post_platform'
named_run_list 'rdp', 'jarbas::pre_platform', 'jarbas::rdp', 'jarbas::post_platform'
named_run_list 'terraform', 'jarbas::pre_platform', 'jarbas::terraform', 'jarbas::post_platform'
named_run_list 'test', 'jarbas::test'
named_run_list 'yay', 'jarbas::yay'
