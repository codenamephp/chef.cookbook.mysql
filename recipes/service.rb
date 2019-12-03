# frozen_string_literal: true

#
# Cookbook:: .
# Recipe:: 5.6
#
# Copyright:: 2018, The Authors, All Rights Reserved.

service 'mariadb' do
  action %i[start enable]
end
