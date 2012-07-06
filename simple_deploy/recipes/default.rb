#
# Cookbook Name:: bundler
# Recipe:: default
#
# Copyright 2012, Intuit, Inc.
#
#
#
include_recipe 'ruby'

gem_package 'simple_deploy' do
  action :install
  gem_binary node["simple_deploy"]["gem_binary"]
  version node["simple_deploy"]["version"]
end
