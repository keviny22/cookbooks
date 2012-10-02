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

include_recipe 'intu_package_repos::custom_packages'

package "intu-ruby" do
  action :install
  version node["ruby"]['version']
end

package "libyaml" do
  action :install
  version node["libyaml"]['version']
end

file "/etc/prelink.conf.d/ruby.conf" do 
  content "-b /usr/bin/ruby\n"
  owner "root"
  group "root"
  mode "0644"
end
