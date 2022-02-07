# InSpec test for recipe jarbas::git

describe package('git') do
  it { should be_installed }
end