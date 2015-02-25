define icingaweb2::mod_file {
  file {$title:
    path    => "${icingaweb2::params::default_confdir}/modules/${title}.ini",
    content => template("icingaweb2/mods/${title}.erb")
  }
}
