action :download do

  file_name = new_resource.file_name
  base = new_resource.base
  archive = new_resource.archive
  id = new_resource.id
  region = new_resource.region
  key = new_resource.key
  secret = new_resource.secret

  execute "Downloading #{id} of #{archive} from Heirloom" do
    command "heirloom download -k #{key} -s #{secret} -n #{archive} -i #{id} -o #{file_name} -r #{region}"
  end

  file file_name do
    owner new_resource.owner
    group new_resource.group
    mode new_resource.mode
  end

end
