Description
===========

Installs and configures Rsyslog.

Requirements
============

Platform
--------

* Red Hat

Cookbooks
---------

None

Attributes
==========

See `attributes/default.rb` for default values.

* `node['rsyslog']['extra_config_directory']` - location for additional config files
* `node['rsyslog']['spool_directory']` - location for spooling

Resource/Provider
=================

* None

Usage
=====

default
-------

Include default recipe in a run list, to get `rsyslog`.

License and Author
==================

Author:: Tommy Bishop

Copyright:: 2011, Intuit, Inc

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
