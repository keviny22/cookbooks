#
# Cookbook Name:: heirloom
# Recipe:: default
#
# Copyright 2012, Intuit, Inc.
#
include_recipe 'ruby'

gem_package 'heirloom' do
  action :install
  gem_binary node["heirloom"]["gem_binary"]
  version node["heirloom"]["version"]
end
