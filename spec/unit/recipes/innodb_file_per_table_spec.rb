#
# Cookbook:: .
# Spec:: innodb_file_per_table
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'codenamephp_mysql::innodb_file_per_table' do
  context 'When all attributes are default' do
    let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }
    let(:template) { chef_run.template('/etc/mysql/conf.d/50-innodb.cnf') }

    it 'includes the service recipe' do
      expect(chef_run).to include_recipe('codenamephp_mysql::service')
    end

    it 'adds innodb config template and restarts mysql service immediately' do
      expect(chef_run).to create_template('/etc/mysql/conf.d/50-innodb.cnf').with(
        source: 'innodb.erb',
        user: 'root',
        group: 'root'
      )
      expect(template).to notify('service[mysql]').to(:restart).immediately
    end
  end
end
