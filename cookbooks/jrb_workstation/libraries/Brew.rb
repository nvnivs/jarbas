#
# Chef Documentation
# https://docs.chef.io/libraries.html
#

#
# This module name was auto-generated from the cookbook name. This name is a
# single word that starts with a capital letter and then continues to use
# camel-casing throughout the remainder of the name.
#
def outdated_casks
  outdated = Mixlib::ShellOut.new("brew cask outdated",
                                  :user => node['jrb_workstation']['user'],
                                  :environment => ({
                                    'HOME' => node['jrb_workstation']['home'],
                                    'USER' => node['jrb_workstation']['user'] }),
                                  :cwd => node['jrb_workstation']['home'])
  outdated.run_command

  if outdated.error? then
    Chef::Log.fatal(outdated.stderr)
    raise 'Fail to get outdated casks'
   end

  outdated.stdout
end
