maintainer       "Intuit, Inc."
maintainer_email "brett_weaver@intuit.com"
description      "Installs RPM Build package"
version          "0.1.0"

%w{ redhat }.each do |os|
  supports os
end
