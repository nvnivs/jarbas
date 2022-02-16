# InSpec test for recipe jarbas::ranger

describe package('ranger') do
  it { should be_installed }
end
