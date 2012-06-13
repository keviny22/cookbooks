default[:loggly][:domain] = "livecommunity"
default[:loggly][:syslog_protocol] = "tcp"
default[:loggly][:application] = "loggly"
default[:loggly][:username] = node[:secrets]['loggly_username']
default[:loggly][:password] = node[:secrets]['loggly_password']
