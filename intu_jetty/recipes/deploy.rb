jetty_user_home = node['intu']['jetty']['user_home']
user = node['intu']['jetty']['user']
group = node['intu']['jetty']['group']

user "#{user}" do
  comment "I run Jetty"
  home jetty_user_home
  shell "/bin/bash"
  not_if { File.exists? "#{jetty_user_home}" }
end

directory "#{jetty_user_home}/logs" do
  owner user
  group group
  mode "0755"
  action :create
  not_if { File.exists? "#{jetty_user_home}/logs" }
end

yum_package "jetty-hightide-server" do
  action :install
  not_if { File.exists? node['intu']['jetty']['home'] }
end

template "/etc/default/jetty" do
  source "jetty-config-options.erb"
  mode "0644"
  owner user
  group group
end
