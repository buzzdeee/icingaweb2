define icingaweb2::enable_module {

  $files=$icingaweb2::params::module_files[$title]
  # $moduledir="${icingaweb2::params::conf_mod_dir}"
  
  $files_with_path=prefix($files,"${title}/")
  
  file {$title:
    ensure => link,
    path   => "${icingaweb2::params::conf_mod_dir}/${title}",
    target => "${icingaweb2::params::system_mod_dir}/${title}",
  }

  #file {$moduledir:
  #  ensure => directory,
  #}

  icingaweb2::module_file {$files_with_path: }
 
}
