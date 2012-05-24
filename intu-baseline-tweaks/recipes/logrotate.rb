#
# Cookbook Name:: base
# Recipe:: umask
#
# Copyright 2011, Intuit, Inc.
#
# All rights reserved - Do Not Redistribute
#

logrotate_app "chef-log" do
  cookbook "logrotate"
  path [ "/var/log/chef/chef.log" ]
  frequency "daily"
  create "640 root root"
  rotate 7
end
