user = node['intu']['jetty']['user']

user user do
  comment "I run Jetty"
  home node['intu']['jetty']['user_home']
  shell "/bin/bash"
end

package "jetty-hightide-server" do
  version "#{node['intu']['jetty']['version']}-1"
end

template "/etc/default/jetty" do
  source "jetty-config-options.erb"
  mode "0644"
  owner user
  group node['intu']['jetty']['group']
  variables :jetty_home => node['intu']['jetty']['home'],
            :jetty_user => user,
            :jetty_port => node['intu']['jetty']['port']
end

cookbook_file "/etc/init.d/jetty" do
  mode "0755"
  owner "root"
  group "root"
end

service "jetty" do
  supports :restart => true
  action [:enable, :start]
end
