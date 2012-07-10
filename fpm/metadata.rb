maintainer       "Intuit, Inc."
maintainer_email "brett_weaver@intuit.com"
description      "Installs Effin Package Manager"
version          "0.1.0"
depends          "ruby"
depends          "rpm-build"
depends          "build-essential"

%w{ redhat }.each do |os|
  supports os
end
