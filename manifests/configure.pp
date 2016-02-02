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
  $show_stacktraces,
  $config_backend,
  $config_resource,
  $ldap_user_class,
  $ldap_user_filter,
  $ldap_user_attribute,
  $ldap_user_base_dn,
  $group_backend,
  $group_resource,
  $ldap_group_class,
  $ldap_group_filter,
  $ldap_group_attribute,
  $ldap_group_member_attribute,
  $ldap_group_base_dn,
  $ldap_host,
  $ldap_port,
  $ldap_encryption,
  $ldap_root_dn,
  $ldap_bind_dn,
  $ldap_bind_pw,
) {

  file{$icingaweb2::params::default_confdir:
    ensure => directory
  }
  file{$icingaweb2::params::conf_mod_dir:
    ensure => directory
  }

  file { "${icingaweb2::params::default_confdir}/authentication.ini":
    owner   => 'root',
    group   => $icingaweb2::params::sysgroup,
    mode    => '0660',
    content => template('icingaweb2/authentication.erb'),
  }
  file { "${icingaweb2::params::default_confdir}/config.ini":
    owner   => 'root',
    group   => $icingaweb2::params::sysgroup,
    mode    => '0660',
    content => template('icingaweb2/config.erb'),
  }
  file { "${icingaweb2::params::default_confdir}/resources.ini":
    owner   => 'root',
    group   => $icingaweb2::params::sysgroup,
    mode    => '0660',
    content => template('icingaweb2/resources.erb'),
  }
  file { "${icingaweb2::params::default_confdir}/roles.ini":
    owner   => 'root',
    group   => $icingaweb2::params::sysgroup,
    mode    => '0660',
    content => template('icingaweb2/roles.erb'),
  }
  file { "${icingaweb2::params::default_confdir}/groups.ini":
    owner   => 'root',
    group   => $icingaweb2::params::sysgroup,
    mode    => '0660',
    content => template('icingaweb2/groups.erb'),
  }
}
