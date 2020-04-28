include_recipe 'jarbas::ruby'

jarbas_execute 'install_gem[jekyll]' do
  command 'gem install jekyll'
  not_if  'gem list | grep -E jekyll'
end
