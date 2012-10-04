maintainer       "Intuit, Inc."
maintainer_email "brett_weaver@intuit.com"
description      "Installs sdbport gem"
version          "0.1.0"
depends          "ruby"

%w{ redhat }.each do |os|
  supports os
end
