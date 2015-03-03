# icingaweb2

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with icingaweb2](#setup)
    * [What icingaweb2 affects](#what-icingaweb2-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with icingaweb2](#beginning-with-icingaweb2)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

The [icinga web 2](http://docs.icinga.org/icinga2/latest/doc/module/icinga2/chapter/getting-started#setting-up-icingaweb2)
modules allows you to setup an Icinga Web 2 front end.

## Module Description

This modules installs [icinga web 2] (http://docs.icinga.org/icinga2/latest/doc/module/icinga2/chapter/getting-started#setting-up-icingaweb2)
front end. It requires to access data generated on a database by an Icinga server backend,
not provided by this module.

If you need an Icinga backend you can use [this module](https://github.com/talamoig/icinga).

## Setup

### What icingaweb2 affects

* configuration files and directory (`/etc/icingaweb2`)
* apache configuration (installs `/etc/httpd/conf.d/icingaweb2.conf`)
* a new yum repository will be installed by default

The yum repository installation can be disabled passing `with_repo => False` to the `icinga` class.
* Can be in list or paragraph form.

### Setup Requirements

An Icinga backend server is required, although it does not need to be on the same host, since
the communication will happen through the database.

### Beginning with icingaweb2

To install Icinga Web 2 with default parameters 

     class {'::icingaweb2': }

In the case you are installing Icinga Web 2 on the same host where is the Icinga2
server, one of the two classes will fail since they will conflict on the management
of the repository.

In that case you should install Icinga Web 2 with:

   class{'::icingaweb2':
	with_repo  => False,
   }

Furthermore you will tipically adjust database parameters. An icinga web 2 will need access
to two databases:
 
 * the backend database (icinga2), having informations about host checks, services, etc.;
 * the frontend database (icinga2), where user preferences are stored.

The configuration of both the databases can be passed to the class:

     class { '::icingaweb2':
     ## backend database
	 dbhost     => 'icinga-db-server',
	 dbtype	    => 'mysql',
	 dbname	    => 'icinga',
	 dbuser	    => 'icinga',
	 dbpasswd   => 'icinga',
	 dbame	    => 'icinga',
     ## frontend database
       	dbwebtype   => 'mysql',
       	dbwebhost   => 'localhost',
       	dbwebport   => '3306',
       	dbwebuser   => 'icinga_web',
       	dbwebpasswd => 'icinga_web',
       	dbwebname   => 'icinga_web',
     ##	modules list
        modules     => ['monitoring']
     }

Furthermore the `module` parameter contains the list of modules to enable.
Actually the only available modules are:
 
 * `monitoring`
 * `setup`, for first installation.

## Limitations

This module has been tested on Scientific Linux 6 and CentOS 6 with
Puppet 3.1.1 and 3.7.4. It should be compatible with any RedHat 6
based distribution.
