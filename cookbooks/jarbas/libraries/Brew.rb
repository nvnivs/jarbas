#
# Chef Documentation
# https://docs.chef.io/libraries.html
#

#
# This module name was auto-generated from the cookbook name. This name is a
# single word that starts with a capital letter and then continues to use
# camel-casing throughout the remainder of the name.
#

def which(cmd)
  exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
  ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
    exts.each do |ext|
      exe = File.join(path, "#{cmd}#{ext}")
      return exe if File.executable?(exe) && !File.directory?(exe)
    end
  end
  nil
end

def outdated_casks
  # Return empty array if brew is not installed
  if which('brew').nil? then return [] end

  outdated = Mixlib::ShellOut.new('brew cask outdated',
                                  user: node['jarbas']['user'],
                                  environment: {
                                    'HOME' => node['jarbas']['home'],
                                    'USER' => node['jarbas']['user'] },
                                  cwd: node['jarbas']['home'])
  outdated.run_command

  if outdated.error?
    Chef::Log.fatal(outdated.stderr)
    raise 'Fail to get outdated casks'
  end

  outdated.stdout.each_line.map { |c| c.gsub('\n', '').strip }
end
