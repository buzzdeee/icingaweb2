# This defined type configures authentication backends
define icingaweb2::authentication (
  $backend,
  $order = 10,
  $backend_resource = undef,
  $ldap_filter = undef,
  $ldap_base_dn = undef,
  $ldap_user_class = 'inetOrgPerson',
  $ldap_user_name_attribute = 'uid',
) {

  require icingaweb2

  validate_re($backend, [ 'db', 'external', 'ldap', 'msldap' ])

  if $title == 'autologin' and $backend != 'external' {
    fail("${::module_name} authentication type ${title} must be of backend type: external, but got: ${backend}")
  }

  if $backend != 'external' and ! $backend_resource {
    fail("${::module_name} authentication backend ${backend} requires to set the \$backend_resource parameter")
  } else {
    validate_string($backend_resource)
    $auth_require = [ Icingaweb2::Resource[$backend_resource] ]
  }

  validate_string($ldap_user_class)
  validate_string($ldap_filter)
  validate_string($ldap_user_name_attribute)
  validate_string($ldap_user_base_dn)

  concat::fragment { "icingaweb2_authentication_${title}":
    content => template('icingaweb2/authentication.erb'),
    order   => $order,
    target  => "${icingaweb2::params::default_confdir}/authentication.ini",
    require => $auth_require,
  }
}
