define icingaweb2::configure_file {
  file{$title:
    ensure => present,
    path => "${icingaweb2::params::default_confdir}/${title}.ini",
    content => template("icingaweb2/$title.erb"),
    require => File[$icingaweb2::params::conf_mod_dir]
  }
}
