define :cron_authorization do
  if params[:user]
    command "echo #{params[:user]} >> /etc/cron.allow"
    not_if do
      IO.read('/etc/cron.allow').include? "\n#{params[:user]}\n"
    end
  end
end

