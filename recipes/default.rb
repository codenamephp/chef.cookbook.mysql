#
# Cookbook:: codenamephp_mysql
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'mysql-server'
package 'mysql-client'

service 'mysql' do
  action %i[start enable]
end

template '/etc/mysql/conf.d/50-innodb.cnf' do
  source 'innodb.erb'
  owner 'root'
  group 'root'
  action :create
  notifies :restart, 'service[mysql]', :immediately
end
