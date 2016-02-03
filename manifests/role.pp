# This defined type configures user roles for the web interface
define icingaweb2::role (
  $users,
  $permissions,
  $order = 10,
) {

  require icingaweb2

  validate_string($users)
  validate_string($permissions)

  concat::fragment { "icingaweb2_role_${title}":
    content => template('icingaweb2/roles.erb'),
    order   => $order,
    target  => "${icingaweb2::params::default_confdir}/roles.ini",
  }
}
