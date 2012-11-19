jetty_user_home = node['intu']['jetty']['user_home']
user = node['intu']['jetty']['user']
group = node['intu']['jetty']['group']

user "#{user}" do
  comment "I run Jetty"
  home jetty_user_home
  shell "/bin/bash"
end

directory "#{jetty_user_home}/logs" do
  owner user
  group group
  mode "0755"
end

yum_package "jetty-hightide-server" do
end

template "/etc/default/jetty" do
  source "jetty-config-options.erb"
  mode "0644"
  owner user
  group group
  variables :jetty_home => node['intu']['jetty']['home'],
            :jetty_user => user,
            :jetty_port => node['intu']['jetty']['port'],
end

template "/etc/init.d/jetty" do
  source "jetty-init-script.erb"
  mode "0755"
  owner "root"
  group "root"
end

service "jetty" do
  supports :restart => true
  action [:enable, :start]
end
