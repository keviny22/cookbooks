maintainer        'Tommy Bishop'
maintainer_email  'thomas_bishop@intuit.com'
license           'Apache 2.0'
description       'Installs maven'
long_description  ''
version           '0.1.0'

recipe 'default', 'Installs maven and adds the bin files to the path'

%w{ redhat }.each do |os|
  supports os
end
