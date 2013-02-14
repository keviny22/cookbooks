actions :create

default_action :create

attribute :app_name,     :kind_of => String
attribute :cwd,          :kind_of => String, :default => Dir.pwd
attribute :environment,  :kind_of => String
attribute :revision,     :kind_of => String
attribute :user,         :kind_of => String, :default => ENV['SUDO_USER'] ||
                                                         ENV['USER'] ||
                                                         'root'
