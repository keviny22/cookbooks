maintainer        "Intuit, Inc.."
maintainer_email  ""
license           "Apache 2.0"
description       "Installs and provides a basic configuration for rsyslog"
version           "0.1.0"

recipe "default", "Installs rsyslog with a basic configuration"

%w{ redhat }.each do |os|
  supports os
end
