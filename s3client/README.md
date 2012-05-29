DESCRIPTION
-----------

Installs and configures support for s3-based file resources
Based on work by Sonian in the awsclient cookbook

PLATFORM
--------

Tested on RHEL

USAGE
-----

(In another recipe)

  include_recipe "s3client"

  s3_file "/tmp/remote_s3_file.tar.bz2" do
    bucket "my-badass-bucket"
    object_name "/path/to/remote_s3_file.tar.bz2"
    aws_access_key_id "accesskey"
    aws_secret_access_key "secretkey"
   mode "644"
  end
