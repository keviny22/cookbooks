default['td_agent']['conf_root']        = '/etc/td-agent'
default['td_agent']['plugins_conf_dir'] = File.join "#{node['default']['td_agent']['conf_root']}", 'plugins'
default['td_agent']['version']          = '1.1.9-0'
