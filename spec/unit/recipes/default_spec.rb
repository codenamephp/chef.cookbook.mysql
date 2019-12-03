# frozen_string_literal: true

#
# Cookbook:: codenamephp_mysql
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'codenamephp_mysql::default' do
  context 'When all attributes are default' do
    let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }
    let(:template) { chef_run.template('/etc/mysql/conf.d/50-innodb.cnf') }

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs mysql server from package' do
      expect(chef_run).to install_package('mariadb-server')
    end

    it 'installs mysql client from package' do
      expect(chef_run).to install_package('mariadb-client')
    end

    it 'includes the service recipe' do
      expect(chef_run).to include_recipe('codenamephp_mysql::service')
    end

    it 'includes the innodb_file_per_table recipe' do
      expect(chef_run).to include_recipe('codenamephp_mysql::innodb_file_per_table')
    end

    it 'includes the innodb_file_per_table recipe' do
      expect(chef_run).to include_recipe('codenamephp_mysql::bindaddress')
    end
  end
end
