class icingaweb2::configure (
  $auth_backend,
  $auth_resource,
  $dbwebtype,
  $dbwebhost,
  $dbwebport,
  $dbwebuser,
  $dbwebpasswd,
  $dbwebname,
  $dbtype,
  $dbhost,
  $dbport,
  $dbuser,
  $dbpasswd,
  $dbname,
  $sysgroup,
  $log_type,
  $log_level,
  $log_application,
  $pref_store,
  $pref_resource,
  $roles_admin_users,
  $roles_admin_perms,
) {

  file{$icingaweb2::params::default_confdir:
    ensure => directory
  }
  file{$icingaweb2::params::conf_mod_dir:
    ensure => directory
  }
  
#  icingaweb2::configure_file { $icingaweb2::params::conf_files: }

  concat { "${icingaweb2::params::default_confdir}/authentication.ini":
    owner => 'root',
    group => $icingaweb2::params::sysgroup,
    mode  => '0660',
  }
  concat::fragment { 'icingaweb_auth_${auth_type}':
    target  => "${icingaweb2::params::default_confdir}/authentication.ini",
    content => template('icingaweb2/authentication.erb'),
    order   => '001',
  }

  concat { "${icingaweb2::params::default_confdir}/config.ini":
    owner => 'root',
    group => $icingaweb2::params::sysgroup,
    mode  => '0660',
  }
  concat::fragment { 'icingaweb_config_ini':
    target  => "${icingaweb2::params::default_confdir}/config.ini",
    content => template('icingaweb2/config.erb'),
    order   => '001',
  }

  concat { "${icingaweb2::params::default_confdir}/resources.ini":
    owner => 'root',
    group => $icingaweb2::params::sysgroup,
    mode  => '0660',
  }
  concat::fragment { 'icingaweb_db_resources_ini':
    target  => "${icingaweb2::params::default_confdir}/resources.ini",
    content => template('icingaweb2/resources.erb'),
    order   => '001',
  }
  
  concat { "${icingaweb2::params::default_confdir}/roles.ini":
    owner => 'root',
    group => $icingaweb2::params::sysgroup,
    mode  => '0660',
  }
  concat::fragment { 'icingaweb_roles_admin_ini':
    target  => "${icingaweb2::params::default_confdir}/roles.ini",
    content => template('icingaweb2/roles.erb'),
    order   => '001',
  }
}
