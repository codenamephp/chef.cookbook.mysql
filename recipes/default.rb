#
# Cookbook:: codenamephp_mysql
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package 'mysql-server'
package 'mysql-client'

include_recipe '::service'
include_recipe '::innodb_file_per_table'
