#
# Cookbook:: .
# Recipe:: 5.6
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package 'dirmngr' # needed to add the key, missing in some base boxes

apt_repository 'oracle mysql' do
  uri 'http://repo.mysql.com/apt/debian'
  repo_name 'oracle-mysql'
  components ['mysql-apt-config', 'mysql-5.6', 'mysql-tools']
  keyserver 'pgp.mit.edu'
  key '5072E1F5'
  deb_src true
end

package 'mysql-server'
package 'mysql-client'

service 'mysql' do
  action %i[start enable]
end

include_recipe '::service'
include_recipe '::innodb_file_per_table'
