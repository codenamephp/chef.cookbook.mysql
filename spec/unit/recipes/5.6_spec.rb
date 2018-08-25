#
# Cookbook:: codenamephp_mysql
# Spec:: 5.6
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'codenamephp_mysql::5.6' do
  context 'When all attributes are default' do
    let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }
    let(:template) { chef_run.template('/etc/mysql/conf.d/50-innodb.cnf') }

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs dirmngr from package' do
      expect(chef_run).to install_package('dirmngr')
    end

    it 'adds the apt repo' do
      expect(chef_run).to add_apt_repository('oracle mysql')
    end

    it 'installs mysql-server from package' do
      expect(chef_run).to install_package('mysql-server')
    end

    it 'installs mysql-client from package' do
      expect(chef_run).to install_package('mysql-client')
    end

    it 'includes the service recipe' do
      expect(chef_run).to include_recipe('codenamephp_mysql::service')
    end

    it 'includes the innodb_file_per_table recipe' do
      expect(chef_run).to include_recipe('codenamephp_mysql::innodb_file_per_table')
    end
  end
end
