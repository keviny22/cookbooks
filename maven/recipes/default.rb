package 'maven' do
  action :install
  version node['maven']['version']
end

file '/etc/profile.d/maven.sh' do
  content "export PATH=/opt/maven/bin:$PATH"
  owner 'root'
  group 'root'
  mode '0644'
end
