#
# Cookbook Name:: s3client
#

#Install deps
packages = ['libxml2-devel','libxslt-devel']
packages.each do |pkg|
  package pkg do
    action :install
  end
end

chef_gem "aws-s3" do
  action :install
end

require "aws/s3"
