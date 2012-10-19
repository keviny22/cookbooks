actions :create

default_action :create

attribute :name, :kind_of        => String,
                 :name_attribute => true,
                 :required       => true
attribute :system_wildcard, :kind_of => String
