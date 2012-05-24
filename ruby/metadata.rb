maintainer       "Intuit, Inc."
maintainer_email "brett_weaver@intuit.com"
license          "Apache 2.0"
description      "Installs Ruby"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

%w{rhel}.each do |os|
  supports os
end
