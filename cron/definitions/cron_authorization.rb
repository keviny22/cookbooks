define :cron_authorization do
  raise ArgumentError.new 'name must be specified' if params[:name].nil? || params[:name].empty?

  command "echo #{params[:name]} >> /etc/cron.allow"
  not_if do
    IO.read('/etc/cron.allow').include? "\n#{params[:name]}\n"
  end
end

