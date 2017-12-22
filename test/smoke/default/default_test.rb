# # encoding: utf-8

# Inspec test for recipe centroid_httpd::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# Verify SELinux config file set to "permissive"
describe file('/etc/selinux/config') do
  its('content') { should match /SELINUX=permissive/ }
end

# Verify SELinux is current set to "permissive"
describe command('getenforce') do
  its('stdout') { should match /Permissive/ }
end

# Verify httpd package was installed
describe package('httpd') do
  it { should be_installed }
end

# Port 80 for Apache should be listening
describe port(80) do
  it { should be_listening }
end
