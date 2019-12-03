# frozen_string_literal: true

#
# Cookbook:: codenamephp_mysql
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'apt'

package 'mariadb-server'
package 'mariadb-client'

include_recipe '::service'
include_recipe '::innodb_file_per_table'
include_recipe '::bindaddress'
include_recipe '::reset_root'
