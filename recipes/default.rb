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

# Add rule to firewall to accept http traffic
execute 'httpd_firewall' do
  command 'firewall-cmd  --permanent --zone public --add-service http'
  ignore_failure true
end

# Reload firewall after adding rule
execute 'reload_firewall' do
  command 'firewall-cmd --reload'
  ignore_failure true
end

# Setup a simple welcome web page
template '/var/www/html/index.html' do
  source 'index_html.erb'
end

# Start and enable Apache
service 'httpd' do
  action [:enable, :start]
end
