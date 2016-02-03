class icingaweb2::modules {  
  icingaweb2::enable_module { $icingaweb2::modules: }

  $modconfdir = "${default_confdir}/modules"

  file { $modconfdir:
    ensure => 'directory'
  }


}
