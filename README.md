Puppet Servicemix Module
========================

Introduction
-----------------

This module install Servicemix with puppet

Installation
-----------------

Clone this repository in a servicemix directory in your puppet module directory

```shell
	git clone https://github.com/ancosen/puppet-servicemix-module servicemix
```

Usage
-----------------

If you include the servicemix::setup class by setting mode to `web` the module will download the package, unzip it and move it 
in a specific directory. If you set the mode `local` the servicemix zip file must be place in `/servicemix/files/` 
folder. The module will do the same operations without download the package.

```puppet
	servicemix::setup { "servicemix":
	  version => "5.0.1",
	  family => "servicemix-5",
	  mode => "local",
	  installdir => "/opt/",
	  tmpdir => "/tmp/"
	  }
```

It's important to define a global search path for the `exec` resource to make module work. 
This should usually be placed in `manifests/site.pp`. It is also important to make sure `unzip` and `tar` command 
are installed on the target system:

```puppet
	Exec {
	  path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
	}

	package { 'tar':
	  ensure => installed
	}

	package { 'unzip':
	  ensure => installed
	}
```

Testing
-----------------

The Puppet servicemix module has been tested on the following Operating Systems: 

1. CentOS 6.5 x64
1. Debian 7.5 x64
1. Fedora 20.0 x86_64
1. Ubuntu 14.04 x64

Contributing
-----------------

Feel free to contribute by testing, opening issues and adding/changing code

License
-----------------

Copyright 2014 Oscerd and contributors

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
