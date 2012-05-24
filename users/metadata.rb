maintainer       "Opscode, Inc."
maintainer_email "cookbooks@opscode.com"
license          "Apache 2.0"
description      "Creates Users From Users Local Databag"
version          "1.0.1"
recipe "users::sysadmin", "searches users data bag for sysadmins and creates users"

%w{ redhat }.each do |os|
  supports os
end
