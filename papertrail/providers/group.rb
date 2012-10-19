def load_current_resource
  client            = Papertrail::Client.new node['papertrail']['api_endpoint'],
                                             node['papertrail']['api_token']
  @current_resource = Papertrail::Group.new new_resource.name, client
end

action :create do
  unless exists?
    Chef::Log.debug "Papertrail group #{new_resource.name} does not exist"

    @current_resource.create new_resource.name, create_parameters

    Chef::Log.debug "Papertrail group #{new_resource.name} created"
    new_resource.updated_by_last_action true
  end
end

private
def create_parameters
  {}.tap do |data|
    if new_resource.system_wildcard
      data.merge! { 'system_wildcard' => new_resource.system_wildcard }
    end
  end
end

def exists?
  @current_resource.exists?
end
