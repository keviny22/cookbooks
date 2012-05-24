#
# Cookbook Name:: ruby
# Recipe:: default
#
# Copyright 2012, Intuit, Inc.
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

remote_file "#{Chef::Config[:file_cache_path]}/libyaml.rpm" do
  source node[:ruby][:libyaml][:url]
  source "#{Chef::Config[:file_cache_path]}/libyaml.rpm"
end

remote_file "#{Chef::Config[:file_cache_path]}/ruby.rpm" do
  source node[:ruby][:url]
  source "#{Chef::Config[:file_cache_path]}/ruby.rpm"
end

rpm_package "libyaml" do
  source "#{Chef::Config[:file_cache_path]}/libyaml.rpm"
end

rpm_package "ruby" do
  source "#{Chef::Config[:file_cache_path]}/ruby.rpm"
end
