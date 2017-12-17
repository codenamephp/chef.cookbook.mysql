#
# Cookbook:: chef.cookbook.mysql
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'chef.cookbook.mysql::default' do
  context 'When all attributes are default' do
    let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }
    let(:template) { chef_run.template('/etc/mysql/conf.d/50-innodb.cnf') }
    
    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
    
    it 'installs mysql server from package' do
      expect(chef_run).to install_package('mysql-server')
    end
    
    it 'installs mysql client from package' do
      expect(chef_run).to install_package('mysql-client')
    end
    
    it 'makes sure the service is started and enabled' do
      expect(chef_run).to enable_service('mysql')
      expect(chef_run).to start_service('mysql')
    end
    
    it 'adds innodb config template and restarts mysql service immediately' do
      expect(chef_run).to create_template('/etc/mysql/conf.d/50-innodb.cnf').with(
        source: 'innodb.erb',
        user:   'root',
        group:  'root'
      )
      expect(template).to notify('service[mysql]').to(:restart).immediately
    end
  end
end
