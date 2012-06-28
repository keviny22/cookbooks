package node['new_relic']['server_monitor']['package_name'] do
  version node['new_relic']['server_monitor']['version']
end

directory File.basename(node['new_relic']['server_monitor']['log_file']) do
  owner 'root'
  group 'root'
  mode '0777'
end

service node['new_relic']['server_monitor']['service_name'] do
  action [:enable]
  supports :status => true, :restart => true
end

template node['new_relic']['server_monitor']['config_file'] do
  owner 'root'
  group 'newrelic'
  mode '0640'
  source 'nrsysmond.cfg.erb'
  variables :license_key => node['new_relic']['config']['license_key'],
            :log_file    => node['new_relic']['server_monitor']['log_file']
  notifies :restart,
            resources(:service => node['new_relic']['server_monitor']['service_name'])
end

service node['new_relic']['server_monitor']['service_name'] do
  action [:start]
end
