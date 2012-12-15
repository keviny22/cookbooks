action :create do
  cmd = command_to_run
  Chef::Log.debug "new relic ruby deployment command to run: #{cmd}"

  execute 'mark deployment in new relic' do
    command cmd
    cwd new_resource.cwd
  end
end

private
def command_to_run
  command = "bundle exec deployment"
  command << " --user #{new_resource.user}"
  command << [app_name, environment, revision].join
end

def app_name
  return '' if new_resource.app_name.nil? || new_resource.app_name.empty?
  " --appname #{new_resource.app_name}"
end

def environment
  return '' if new_resource.environment.nil? || new_resource.environment.empty?
  " --environment #{new_resource.environment}"
end

def revision
  return '' if new_resource.revision.nil? || new_resource.revision.empty?
  " --revision #{new_resource.revision}"
end
