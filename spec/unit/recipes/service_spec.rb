# frozen_string_literal: true

#
# Cookbook:: codenamephp_mysql
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'codenamephp_mysql::service' do
  context 'When all attributes are default' do
    let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'makes sure the service is started and enabled' do
      expect(chef_run).to enable_service('mariadb')
      expect(chef_run).to start_service('mariadb')
    end
  end
end
