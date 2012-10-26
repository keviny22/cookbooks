user "jetty" do
  comment "I run Jetty"
  home "/home/jetty"
  shell "/bin/bash"
  not_if { File.exists? "/home/jetty" }
end

directory "/home/jetty/logs" do
  owner "jetty"
  group "jetty"
  mode "0755"
  action :create
  not_if { File.exists? "/home/jetty/logs" }
end

yum_package "jetty-hightide-server" do
  action :install
  not_if { File.exists? node['intu']['jetty']['home'] }
end

template "/etc/default/jetty" do
  source "jetty-config-options.erb"
  mode "0644"
  owner node['intu']['jetty']['user']
  group node['intu']['jetty']['group']
end
