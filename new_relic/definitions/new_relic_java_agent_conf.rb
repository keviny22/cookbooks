define :new_relic_java_agent_config do
  node['new_relic']['config']['file_path'] = params[:name]

  template node['new_relic']['config']['file_path'] do
    backup false
    cookbook 'new_relic'
    source 'java_agent_newrelic.yml.erb'
    variables :config_var => node['new_relic']['config']
  end
end
