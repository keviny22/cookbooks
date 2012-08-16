#
# Author:: Seth Chisamore (<schisamo@opscode.com>)
# Cookbook Name:: chef_handlers
# Recipe:: default
#
# Copyright 2011, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

remote_directory "#{Chef::Config[:file_cache_path]}/gems" do
  source 'gems'
  action :nothing
end.run_action(:create)

execute "Install gems required for tinder" do
  command "/opt/chef/embedded/bin/gem install -l *"
  cwd "#{Chef::Config[:file_cache_path]}/gems"
  action :nothing
end.run_action(:run)

Gem.clear_paths
require 'tinder'

Chef::Log.info("Chef Handlers will be at: #{node['chef_handler']['handler_path']}")

remote_directory node['chef_handler']['handler_path'] do
  source 'handlers'
  action :nothing
end.run_action(:create)
