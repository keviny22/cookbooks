template node['new_relic']['config']['file_path'] do
  source 'newrelic.yml.erb'
  variables :config_var => node['new_relic']['config']
end
