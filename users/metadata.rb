maintainer       "Opscode, Inc."
maintainer_email "cookbooks@opscode.com"
license          "Apache 2.0"
description      "Creates Users From Local Databag"
version          "1.0.1"
recipe "users::default", "adds users from data bag"

%w{ redhat }.each do |os|
  supports os
end
