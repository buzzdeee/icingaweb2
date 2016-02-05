class icingaweb2::modules {
  file { "${::icingaweb2::params::default_confdir}/modules":
    ensure => 'directory'
  }
}
