# frozen_string_literal: true

#
# Cookbook:: .
# Recipe:: innodb_file_per_table
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe '::service'

template '/etc/mysql/mariadb.conf.d/60-innodb.cnf' do
  source 'innodb.cnf.erb'
  owner 'root'
  group 'root'
  action :create
  notifies :restart, 'service[mariadb]', :immediately
end
