#
# Cookbook:: centroid_httpd
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
package 'httpd' do
  :install
end

file '/var/www/html/index.html' do
  content '<h1>Welcome Home! This is a test of the Chef HTTPD Cookbook.</h1>'
end

service 'httpd' do
  action [:enable, :start]
end
