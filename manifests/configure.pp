class icingaweb2::configure (
#  $auth_backend,
#  $auth_resource,
#  $dbwebtype,
#  $dbwebhost,
#  $dbwebport,
#  $dbwebuser,
#  $dbwebpasswd,
#  $dbwebname,
#  $dbtype,
#  $dbhost,
#  $dbport,
#  $dbuser,
#  $dbpasswd,
#  $dbname,
  $sysgroup,
  $log_type,
  $log_level,
  $log_application,
  $pref_store,
  $pref_resource,
#  $roles_admin_users,
#  $roles_admin_perms,
  $show_stacktraces,
  $config_backend,
  $config_resource,
#  $ldap_user_class,
#  $ldap_user_filter,
#  $ldap_user_attribute,
#  $ldap_user_base_dn,
  $group_backend,
  $group_resource,
  $group_user_backend,
  $ldap_group_class,
  $ldap_group_filter,
  $ldap_group_attribute,
  $ldap_group_member_attribute,
  $ldap_group_base_dn,
#  $ldap_host,
#  $ldap_port,
#  $ldap_encryption,
#  $ldap_root_dn,
#  $ldap_bind_dn,
#  $ldap_bind_pw,
) {

  validate_re($pref_store, ['db', 'ini'])
#  if $pref_store == 'db' {
#    unless defined(Icingaweb2::Resource[$pref_resource]) {
#      fail("${::module_name} preferences db resource specified in \$pref_resource ${pref_resource} not found in catalog")
#    }
#  }

  validate_string($group_backend)
  validate_string($group_resource)
  validate_string($group_user_backend)
  #unless defined(Icingaweb2::Resource[$group_resource]) {
  #  fail("${::module_name} group resource specified in \$group_resource ${group_resource} not found in catalog")
  #}
  #unless defined(Icingaweb2::Authentication[$group_user_backend]) {
  #  fail("${::module_name} user authentication backend specified in \$group_user_backend ${group_user_backend} not found in catalog")
  #}

  file{$icingaweb2::params::default_confdir:
    ensure => directory
  }
  file{$icingaweb2::params::conf_mod_dir:
    ensure => directory
  }

  concat { "${icingaweb2::params::default_confdir}/authentication.ini":
    owner   => 'root',
    group   => $icingaweb2::params::sysgroup,
    mode    => '0660',
  }
  concat::fragment { 'icingaweb2_authentication_ini_header':
    content => template('icingaweb2/header.erb'),
    order   => '00',
    target  => "${icingaweb2::params::default_confdir}/authentication.ini",
  }

  file { "${icingaweb2::params::default_confdir}/config.ini":
    owner   => 'root',
    group   => $icingaweb2::params::sysgroup,
    mode    => '0660',
    content => template('icingaweb2/config.erb'),
  }

  concat { "${icingaweb2::params::default_confdir}/resources.ini":
    owner   => 'root',
    group   => $icingaweb2::params::sysgroup,
    mode    => '0660',
  }
  concat::fragment { 'icingaweb2_resources_ini_header':
    content => template('icingaweb2/header.erb'),
    order   => '00',
    target  => "${icingaweb2::params::default_confdir}/resources.ini",
  }

  concat { "${icingaweb2::params::default_confdir}/roles.ini":
    owner   => 'root',
    group   => $icingaweb2::params::sysgroup,
    mode    => '0660',
  }
  concat::fragment { 'icingaweb2_roles_ini_header':
    content => template('icingaweb2/header.erb'),
    order   => '00',
    target  => "${icingaweb2::params::default_confdir}/roles.ini",
  }

  file { "${icingaweb2::params::default_confdir}/groups.ini":
    owner   => 'root',
    group   => $icingaweb2::params::sysgroup,
    mode    => '0660',
    content => template('icingaweb2/groups.erb'),
  }

  Icingaweb2::Resource <| |> ->
  Icingaweb2::Authentication <| |> ->
  Icingaweb2::Role <| |> ->
  File["${icingaweb2::params::default_confdir}/config.ini"] ->
  File["${icingaweb2::params::default_confdir}/groups.ini"]

}
