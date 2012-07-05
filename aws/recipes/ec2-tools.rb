include_recipe 'java'

["/etc/profile.d/aws.csh", "/etc/profile.d/aws.sh"].each do |f|
  file f do
    action :delete
  end
end

execute "Remove Baseline AWS Tools" do
  command "/bin/rm -rf /usr/local/ec2"
end

file "/etc/profile.d/aws-ec2.sh" do
  content <<-EOS
    export EC2_HOME=/usr
    export EC2_CERT=$HOME/.ec2_cert
    export EC2_PRIVATE_KEY=$HOME/.ec2_private_key
  EOS
  mode 0755
end

package "intu-amzn-ec2-tools"
