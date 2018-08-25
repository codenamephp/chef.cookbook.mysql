#
# Cookbook:: .
# Recipe:: 5.6
#
# Copyright:: 2018, The Authors, All Rights Reserved.

service 'mysql' do
  action %i[start enable]
end
