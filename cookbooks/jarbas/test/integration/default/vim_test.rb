# InSpec test for recipe jarbas::vim

describe package('vim') do
  it { should be_installed }
end