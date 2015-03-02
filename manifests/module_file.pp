define icingaweb2::module_file {
  file {$title:
    path    => "${icingaweb2::params::default_confdir}/modules/${title}.ini",
    content => template("icingaweb2/modules/${title}.erb")
  }
}
