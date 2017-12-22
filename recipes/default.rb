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
template '/var/www/html/index.html' do
  source 'index_html.erb'
end

# Start and enable Apache
service 'httpd' do
  action [:enable, :start]
end
