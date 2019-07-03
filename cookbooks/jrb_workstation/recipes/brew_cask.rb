#
# Cookbook:: jrb_workstation
# Recipe:: brew_cask
#
# Copyright:: 2019, The Authors, All Rights Reserved.

homebrew_tap 'caskroom/cask'
homebrew_tap 'caskroom/versions'
homebrew_tap 'chef/chef'

homebrew_tap 'homebrew/cask-versions' do
  action :untap
end

# Available casks at https://github.com/Homebrew/homebrew-cask/tree/master/Casks
casks = [
  'android-file-transfer',         # Android File Transfer
  'blue-jeans',                    # Video conferencing (TODO: does not auto install)
  'caffeine',                      # Prevents sleep
  'chefdk',
  'docker',
  # evernote
  # firefox                       # Firefox (TODO: would rather have dev edition but can find it on brew)
  'google-chrome',
  'gpg-suite', # encrypt, decrypt, sign and verify files or messages
  # iterm2                        # Terminal
  'java8', # Java Standard Edition Development Kit
  # microsoft-remote-desktop-beta
  'minikube', # Minikube is a tool that makes it easy to run Kubernetes locally.
  'mysql-shell',
  # 'p4v',                           # Perforce SHASUM failures
  # slack
  # spotify
  # tunnelblick                   # VPN client
  'virtualbox',
  'visual-studio-code'
]

casks.each do |c|
  homebrew_cask c
end

# Get all outdated casks
outdated = Mixlib::ShellOut.new("brew cask outdated",
                                :user => Homebrew.owner,
                                :environment => ({ 'HOME' => ::Dir.home(Homebrew.owner), 'USER' => Homebrew.owner }),
                                :cwd => ::Dir.home(Homebrew.owner))
outdated.run_command

# Fail if outdated casks errored
if outdated.error? then
  Chef::Log.fatal(outdated.stderr)
  raise 'Fail to get outdated casks'
end

Chef::Log.warn(casks.include? 'vagrant')
# Update outdated casks
outdated.stdout.each_line do |cask|
  cask = cask.gsub('\n', '').strip
  execute "brew_cask_upgrade[#{cask}]" do
    command "brew cask upgrade #{cask}"
    user Homebrew.owner
    environment ({ 'HOME' => ::Dir.home(Homebrew.owner), 'USER' => Homebrew.owner })
    cwd ::Dir.home(Homebrew.owner)
    only_if { casks.include? cask }
  end
end
