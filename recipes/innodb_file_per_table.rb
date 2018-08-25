#
# Cookbook:: .
# Recipe:: innodb_file_per_table
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe '::service'

template '/etc/mysql/conf.d/50-innodb.cnf' do
  source 'innodb.erb'
  owner 'root'
  group 'root'
  action :create
  notifies :restart, 'service[mysql]', :immediately
end
