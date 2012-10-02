urls = { 'us-west-1' => 'http://s3-us-west-1.amazonaws.com/intu-packages-us-west-1/rhel/6/x86_64',
         'us-west-2' => 'http://s3-us-west-2.amazonaws.com/intu-packages-us-west-2/rhel/6/x86_64',
         'us-east-1' => 'http://s3.amazonaws.com/intu-packages-us-east-1/rhel/6/x86_64' }

default['intu']['package_repo_urls'] = urls
