# this defined type takes care to create resource
# entries in resources.ini
define icingaweb2::resource (
  $resourcetype,
  $order = 10,
  $dbtype = undef,
  $host = '127.0.0.1',
  $port = undef,
  $dbname = undef,
  $user = undef,
  $password = undef,
  $charset = 'UTF-8',
  $persistent = '0',
  $encryption = undef,
  $root_dn = undef,
  $bind_dn = undef,
  $bind_pw = undef,
  $private_key = undef,
) {

  require icingaweb2

  case $resourcetype {
    'db': {
      if ! $port {
        if $dbtype == 'mysql' {
          $real_port = $icingaweb2::params::mysql_default_port
        } else {
          $real_port = $icingaweb2::params::pgsql_default_port
        }
      } else {
        $real_port = $port
      }
    }
    'ldap': {
      if ! $port {
        $real_port = $icingaweb2::params::ldap_port
      } else {
        $real_port = $port
      }
    }
    'msldap': {

    }
    'ssh': {
    }
    default: {
      # cannot end up here, validate_re takes care already
    }
  }

  concat::fragment { "icingaweb2_resource_${title}":
    content => template('icingaweb2/resources.erb'),
    order   => $order,
    target  => "${icingaweb2::params::default_confdir}/resources.ini",
  }
}
