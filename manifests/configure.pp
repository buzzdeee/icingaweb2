class icingaweb2::configure {

  file{$icingaweb2::params::conf_mod_dir:
    ensure => directory
  }
  
  icingaweb2::configure_file { $icingaweb2::params::conf_files: }
  
}
