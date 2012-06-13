class Chef::Recipe
  include Opscode::Loggly::Input
end

application = node[:loggly][:application]
protocol = node[:loggly][:syslog_protocol]
device_ip = node[:ec2][:public_ipv4]

instance_id = node['ec2']['instance_id']
role =  node[:metadata]['Role']
stack =  node[:metadata]['StackName']
loggly_endpoint = "logs.loggly.com"

# Loggly input is application - stack - syslog
loggly_input = "#{application}-#{stack}-syslog"

# Lookup the loggly port
port = find_input_port(node[:loggly][:domain],loggly_input)

loggly_input loggly_input do
  domain node[:loggly][:domain]
  type "syslog#{protocol}"
  description "syslog messages from nodes in #{application} : #{stack}"
  action :create
end

loggly_device device_ip do
  domain node[:loggly][:domain]
  device_name "#{role}_#{instance_id}"
  input loggly_input
  action :add
end
