package 'rsyslog' do
  action :install
  version node['rsyslog']['version']
end

directory node['rsyslog']['extra_config_directory'] do
  owner 'root'
  group 'root'
  mode 0755
end

directory node['rsyslog']['spool_directory'] do
  owner 'root'
  group 'root'
  mode 0755
end

template '/etc/rsyslog.conf' do
  source 'rsyslog.conf.erb'
  owner 'root'
  group 'root'
  mode 0644
  variables :spool_directory => node['rsyslog']['spool_directory']
  notifies :restart, 'service[rsyslog]'
end

service 'rsyslog' do
  supports :restart => true, :reload => true
  action [:enable, :start]
end
