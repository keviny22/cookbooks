#
# Author:: Seth Chisamore (<schisamo@opscode.com>)
# Cookbook Name:: java
# Attributes:: default 
#
# Copyright 2010, Opscode, Inc.
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

# default jdk attributes
default['java']['install_flavor'] = "oracle"
default['java']['jdk_version'] = '6'
default['java']['arch'] = kernel['machine'] =~ /x86_64/ ? "x86_64" : "i586"
default['java']['java_home'] = "/usr/lib/jvm/java"

# jdk6 attributes
# x86_64
default['java']['jdk']['6']['x86_64']['url'] = 'https://s3-us-west-1.amazonaws.com/intu-artifacts-us-west-1/rhel6/jdk-6u25-linux-x64.bin'
default['java']['jdk']['6']['x86_64']['checksum'] = '43eabe42bb8d6e8dfe33f3a815f265ac5d5bb586'

# jdk7 attributes
# x86_64
default['java']['jdk']['7']['x86_64']['url'] = 'http://download.example.com/otn-pub/java/jdk/7u2-b13/jdk-7u2-linux-x64.tar.gz'
default['java']['jdk']['7']['x86_64']['checksum'] = '411a204122c5e45876d6edae1a031b718c01e6175833740b406e8aafc37bc82d'
