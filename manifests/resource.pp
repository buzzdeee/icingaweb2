define icingaweb2::resource (
  $resourcetype,
  $order = 10,
  $dbtype = undef,
  $host = 'localhost',
  $port = undef,
  $dbname = undef,
  $dbuser = undef,
  $dbpassword = undef,
  $charset = 'UTF-8',
  $persistent = '0',
  $encryption = undef,
  $root_dn = undef,
  $bind_dn = undef,
  $bind_pw = undef,
) {

  require icingaweb2

  validate_re($resourcetype, [ 'db', 'ldap', 'msldap', ])

  case $resourcetype {
    'db': {
      validate_re($dbtype, [ 'mysql', 'pgsql', ])
      validate_string($host)
      validate_string($dbname)
      validate_string($dbuser)
      validate_string($dbpassword)
      validate_string($charset)
      validate_re($persistent, ['0', '1'])
      if ! $port {
        if $dbtype == 'mysql' {
          $real_port = $icingaweb2::params::mysql_default_port
        } else {
          $real_port = $icingaweb2::params::pgsql_default_port
        }
      } else {
        $real_port = $port
      }
      validate_re($real_port, '^\d+$')
    }
    'ldap': {
      validate_string($host)
      validate_string($encryption)
      validate_string($root_dn)
      validate_string($bind_dn)
      validate_string($bind_pw)
      if ! $port {
        $real_port = $icingaweb2::params::ldap_port
      } else {
        $real_port = $port
      }
      validate_re($real_port, '^\d+$')
    }
    'msldap': {

    }
    default: {
      # cannot end up here, validate_re takes care already
    }
  }

  validate_string($ldap_user_class)
  validate_string($ldap_user_name_attribute) 
  validate_string($ldap_filter)

  concat::fragment { "icingaweb2_resource_${title}":
    content => template('icingaweb2/resources.erb'),
    order   => $order,
    target  => "${icingaweb2::params::default_confdir}/resources.ini",
  }
}
