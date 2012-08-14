actions :download

attribute :file_name, :kind_of => String, :name_attribute => true
attribute :base, :kind_of => String
attribute :id, :kind_of => String
attribute :archive, :kind_of => String
attribute :key, :kind_of => String
attribute :secret, :kind_of => String
attribute :region, :kind_of => String, :default => 'us-west-1'
attribute :owner, :kind_of => String, :default => 'root'
attribute :group, :kind_of => String, :default => 'root'
attribute :mode, :kind_of => String, :default => '0600'
