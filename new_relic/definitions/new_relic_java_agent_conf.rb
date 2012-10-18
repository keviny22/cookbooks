define :new_relic_java_agent_config do
  template params[:name] do
    backup false
    cookbook 'new_relic'
    source 'java_agent_newrelic.yml.erb'
    variables :config_var => node['new_relic']['config']
  end
end
