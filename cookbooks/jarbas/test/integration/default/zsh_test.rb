# InSpec test for recipe jarbas::zsh

describe package('zsh') do
  it { should be_installed }
end
