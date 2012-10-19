class Chef::Recipe
  include Papertrail::Group
end

action :create do
  unless exists? new_resource.name
    Chef::Log.debug "Papertrail group #{new_resource.name} does not exist"
    create new_resource.name, new_resource.system_wildcard
    Chef::Log.debug "Papertrail group #{new_resource.name} created"
    new_resource.updated_by_last_action true
  end
end
