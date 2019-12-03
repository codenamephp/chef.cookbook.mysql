# frozen_string_literal: true

#
# Cookbook:: .
# Recipe:: bindaddress
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe '::service'

template '/etc/mysql/mariadb.conf.d/60-bindaddress.cnf' do
  source 'bindaddress.cnf.erb'
  owner 'root'
  group 'root'
  action :create
  notifies :restart, 'service[mariadb]', :immediately
end
