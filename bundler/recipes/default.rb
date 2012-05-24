#
# Cookbook Name:: bundler
# Recipe:: default
#
# Copyright 2012, Intuit, Inc.
#
#
#
gem_package 'bundler' do
  action :install
  gem_binary node["bundler"]["gem_binary"]
  version node["bundler"]["version"]
end
