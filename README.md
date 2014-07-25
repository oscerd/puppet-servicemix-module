Puppet Servicemix Module
========================

## <a name='TOC'>Table of Contents</a>

  1. [Introduction](#Introduction)
  1. [Installation](#Installation)
  1. [Usage](#Usage)
  1. [Contributing](#Contributing)

## <a name='Introduction'>Introduction</a>

This module install Servicemix with puppet

## <a name='Installation'>Installation</a>

Clone this repository in a servicemix directory in your puppet module directory

	git clone https://github.com/ancosen/puppet-servicemix-module servicemix

## <a name='Usage'>Usage</a>

If you include the servicemix class by setting mode to `web` the module will download the package, unzip it and move it 
in a specific directory. If you set the mode `local` the servicemix zip file must be place in `/modules/module_name/files/` 
folder. The module will do the same operations without download the package.

	servicemix::setup { "servicemix":
	  version => "5.0.1",
	  family => "servicemix-5",
	  mode => "local",
	  path => "/opt/",
	  tmp => "/tmp/"
	  }

It's important to define a global search path for the `exec` resource to make module work. 
This should usually be placed in `manifests/site.pp`:

	Exec {
	  path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
	}

## <a name='Contributing'>Contributing</a>

Feel free to contribute by testing, opening issues and adding/changing code
