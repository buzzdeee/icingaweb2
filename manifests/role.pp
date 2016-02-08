# This defined type configures user roles for the web interface
define icingaweb2::role (
  $permissions,
  $users = undef,
  $groups = undef,
  $order = 10,
) {

  require icingaweb2

  if ! $users and ! $groups {
    fail("${::module_name}: to define a role, you have to specify \$users or \$groups, or both.")
  }

  validate_string($users)
  validate_string($groups)
  validate_string($permissions)



  concat::fragment { "icingaweb2_role_${title}":
    content => template('icingaweb2/roles.erb'),
    order   => $order,
    target  => "${icingaweb2::params::default_confdir}/roles.ini",
  }
}
