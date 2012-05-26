Description
===========

Creates users from a databag search.

Requirements
============

Platform
--------

* Red Hat

Data bag named "users" must exist. See USAGE.

Usage
=====

Create a data_bag users under the /data_bags directory. 

    mkdir data_bags/users
    $EDITOR data_bags/users/bofh.json

Populate it with individual user.json files with the following:

    {
      "id": "bofh",
      "ssh_keys": "ssh-rsa AAAAB3Nz...yhCw== bofh",
      "groups": "sysadmin",
      "uid": 2001,
      "shell": "\/bin\/bash",
      "comment": "BOFH",
    }

Paste the user's public SSH key into the ssh_keys value. Also make sure the uid is unique, and if you're not using bash, that the shell is installed. Group must be sysadmin.

The recipe will also create the sysadmin group. If you're using the opscode sudo cookbook, they'll have sudo access in the default site-cookbooks template. They won't have passwords though, so the sudo cookbook's template needs to be adjusted so the sysadmin group has NOPASSWD.

The sysadmin group will be created with GID 2300. This may become an attribute at a later date.

The Apache cookbook can set up authentication using OpenIDs, which is set up using the openid key here. See the Opscode 'apache2' cookbook for more information about this.

License and Author
==================

Author:: Joshua Timberman (<joshua@opscode.com>)
Author:: Seth Chisamore (<schisamo@opscode.com>)

Copyright:: 2009-2011, Opscode, Inc

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
