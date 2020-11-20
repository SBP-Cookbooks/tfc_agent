# InSpec test for recipe tfc_agent::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

describe docker_container('tfc-agent-test-kitchen') do
  it { should exist }
  it { should be_running }
  its('id') { should_not eq '' }
  its('image') { should eq 'hashicorp/tfc-agent:latest' }
  its('repo') { should eq 'hashicorp/tfc-agent' }
  its('tag') { should eq 'latest' }
  its('command') { should eq '/bin/tfc-agent' }
end
