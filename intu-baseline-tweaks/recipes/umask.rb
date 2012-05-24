#
# Cookbook Name:: base
# Recipe:: umask
#
# Copyright 2011, Intuit, Inc.
#
# All rights reserved - Do Not Redistribute
#

%w{/root/.bashrc /root/.bash_profile /etc/bashrc /etc/profile}.each do |file|
  execute "umask-#{file}" do
    command "umask 022 ; chmod 664 #{file}; sed -i '/umask 077/d' #{file}"
    action :run
  end
end
