#
# Cookbook:: centroid_httpd
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
# Install Apache
package 'httpd'

# Configure SELinux to "permissive"
execute 'setenforce' do
  command 'sudo setenforce permissive'
end

# Configure SELinux conf file for "permissive" (maintain setting after reboot)
template '/etc/selinux/config' do
  source 'selinux.erb'
end

# Setup a simple welcome web page
file '/var/www/html/index.html' do
  content '<h1>Welcome Home! This is a test of the Chef HTTPD Cookbook.</h1>'
end

# Start and enable Apache
service 'httpd' do
  action [:enable, :start]
end
