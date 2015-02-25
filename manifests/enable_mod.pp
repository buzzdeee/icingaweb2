define icingaweb2::enable_mod {

  $files=$icingaweb2::params::mods_files[$title]
  $moddir="${icingaweb2::params::default_confdir}/modules/${title}/"
  
  $files_with_path=prefix($files,"${title}/")
  
  file {$title:
    ensure => link,
    path   => "${icingaweb2::params::conf_mod_dir}/${title}",
    target => "${icingaweb2::params::system_mod_dir}/${title}",
  }

  file {$moddir:
    ensure => directory,
  }

  icingaweb2::mod_file {$files_with_path: }
 
}
