# Inspec test for recipe .::5.6

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

control 'oracle mysql-1.0' do
  title 'Install oracle mysql version 5.6'
  desc 'Install oracle mysql version 5.6 from the official oracle apt repository'

  describe service('mysql') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end

  describe command('mysql --version') do
    its('stdout') { should match(/mysql  Ver.*Distrib 5\.6/) }
  end

  describe file('/etc/mysql/conf.d/50-innodb.cnf') do
    it { should exist }
  end

  describe command('mysql -NBe "SHOW GLOBAL VARIABLES WHERE Variable_name=\'innodb_file_per_table\';"') do
    its('stdout') { should match(/innodb_file_per_table\s+ON/) }
  end
end
