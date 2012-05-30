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

gem_package "aws-s3" do
  action :install
end
