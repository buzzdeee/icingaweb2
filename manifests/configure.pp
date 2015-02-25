class icingaweb2::configure {

  define icinga_conf_file {
    file{$title:
      ensure => present,
      path => "${icingaweb2::params::default_confdir}/${title}.ini",
      content => template("icingaweb2/$title.erb"),
    }
  }
  
  icinga_conf_file { $icingaweb2::params::conf_files: }
  
}
