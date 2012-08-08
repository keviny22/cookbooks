require 'etc'

action :download do

  file_name = new_resource.file_name
  bucket = new_resource.bucket
  object_name = new_resource.object_name

  execute "Downloading #{file_name} from s3" do
    not_if { ::File.file? file_name }
    command "s3cmd get s3://#{bucket}/#{object_name} #{file_name}"
  end

  file file_name do
    owner new_resource.owner
    group new_resource.group
    mode new_resource.mode
  end

end
