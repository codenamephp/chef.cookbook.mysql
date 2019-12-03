# frozen_string_literal: true

#
# Cookbook:: .
# Spec:: innodb_file_per_table
#
# Copyright:: 2018, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'codenamephp_mysql::innodb_file_per_table' do
  context 'When all attributes are default' do
    let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }
    let(:template) { chef_run.template('/etc/mysql/mariadb.conf.d/60-innodb.cnf') }

    it 'includes the service recipe' do
      expect(chef_run).to include_recipe('codenamephp_mysql::service')
    end

    it 'adds innodb config template and restarts mariadb service immediately' do
      expect(chef_run).to create_template('/etc/mysql/mariadb.conf.d/60-innodb.cnf').with(
        source: 'innodb.cnf.erb',
        user: 'root',
        group: 'root'
      )
      expect(template).to notify('service[mariadb]').to(:restart).immediately
    end
  end
end
