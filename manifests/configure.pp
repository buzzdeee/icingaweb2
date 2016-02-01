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
    target  => $config_file,
    content => template('icingaweb2/authentication.erb'),
    order   => '001',
  }
  
}
