include Papertrail::Group

def load_current_resource
  @current_resource = Group.new new_resource.name
end

action :create do
  unless exists?
    Chef::Log.debug "Papertrail group #{new_resource.name} does not exist"
    @current_resource.create new_resource.name,
                             new_resource.system_wildcard
    Chef::Log.debug "Papertrail group #{new_resource.name} created"
    new_resource.updated_by_last_action true
  end
end

private
def exists?
  @current_resource.exists?
end
