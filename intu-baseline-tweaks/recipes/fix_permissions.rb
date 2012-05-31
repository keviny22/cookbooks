#
# Cookbook Name:: intu-baseline-tweaks
# Recipe:: fix_permissions
#
# Copyright 2011, Intuit, Inc.
#
# All rights reserved - Do Not Redistribute
#

%w{/etc/resolv.conf}.each do |file|
  execute "Update #{file} permissions" do
    command "chmod 644 #{file}"
    action :run
  end
end
