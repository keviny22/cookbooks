#
# Author:: Brett Weaver (brett_weaver@intuit.com)
# Cookbook Name:: loggly
# Recipe:: syslog-shipper

class Chef::Recipe
    include Opscode::Loggly::Input
end

package "gcc-c++" do
  action :install
end

gem_package "syslog-shipper" do
  action :install
end

# Grab necessary information for loggly
application = node[:loggly][:application]
environment = node[:environment]

# Setup loggly input and endpoint
loggly_input = "#{application}-#{environment}-syslog"
loggly_endpoint = "logs.loggly.com"

# Loggly port / protocol
port = find_input_port(node[:loggly][:domain],loggly_input)
protocol = node[:loggly][:syslog_protocol]

template "/etc/init.d/syslog-shipper" do
  source "syslog-shipper.erb"
  backup false
  variables(
    :protocol => protocol,
    :server => loggly_endpoint,
    :port => port
  )
  owner "root"
  group "root"
  mode 0755
end

directory "/etc/syslog-shipper" do
  owner "root"
  group "root"
  mode 0755
end

service "syslog-shipper"
