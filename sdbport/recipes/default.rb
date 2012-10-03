#
# Cookbook Name:: sdbport
# Recipe:: default
#
# Copyright 2012, Intuit, Inc.
#
#
#
gem_package 'sdbport' do
  action :install
  gem_binary node["sdbport"]["gem_binary"]
  version node["sdbport"]["version"]
end
