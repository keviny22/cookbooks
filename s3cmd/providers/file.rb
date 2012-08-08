require 'etc'

action :download do

  file_name = new_resource.file_name
  bucket = new_resource.bucket
  object_name = new_resource.object_name
  owner = Etc.getpwnam new_resource.owner
  group = Etc.getgrnam new_resource.group

  execute "Downloading #{file_name} from s3" do
    not_if { ::File.file? file_name }
    command "s3cmd get s3://#{bucket}/#{object_name} #{file_name}"
  end
  
  ruby_block "Setting #{file_name} permissions" do
    block do
      ::File.chmod new_resource.mode.to_i, file_name
      ::File.chown owner.uid, group.gid, file_name
    end
  end
  
end
