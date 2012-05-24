template "/etc/default/useradd" do
  source "useradd.erb"
  mode "0600"
  owner "root"
  group "root"
end

template "/etc/login.defs" do
  source "login.defs.erb"
  mode "0640"
  owner "root"
  group "root"
end

["ec2-user", "root"].each do |u|
  execute "Validate password expiration disabled for #{u}" do
    command "chage -I -1 -m 0 -M 99999 -E -1 #{u}"
    not_if "egrep ^#{u}: /etc/shadow |cut -d: -f5 |egrep ^99999$"
  end
end
