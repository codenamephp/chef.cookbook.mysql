# # encoding: utf-8

# Inspec test for recipe chef.cookbook.mysql::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

control "mysql-1.0" do
  title "Install mysql/mariadb"
  desc "Install mysql/mariadb"
  
  describe command('sudo mysql --version') do
    its('stdout') { should match /mysql  Ver/ }
  end
  
  describe file('/etc/mysql/conf.d/50-innodb.cnf') do
   it { should exist }
  end
  
  describe command('sudo mysql -NBe "SHOW GLOBAL VARIABLES WHERE Variable_name=\'innodb_file_per_table\';"') do
    its('stdout') { should match /innodb_file_per_table\s+ON/ }
  end
end
