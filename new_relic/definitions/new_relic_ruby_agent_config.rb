define :new_relic_ruby_agent_config do
    node['new_relic']['config']['file_path'] = params[:name]
    include_recipe 'new_relic::ruby_agent'
end
