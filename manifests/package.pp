# Takes care of package installation
class icingaweb2::package {
  
  package{ $icingaweb2::params::package_names:
    ensure          => present,
    install_options => $icingaweb2::params::package_install_options,
  }

  case $icingaweb2::dbwebtype {
    'mysql': {
      package{$icingaweb2::params::mysql_packages:
        ensure          => installed,
        install_options => $icingaweb2::params::package_install_options,
      }
    }
    'pgsql': {
      package{$icingaweb2::params::pgsql_packages:
        ensure          => installed,
        install_options => $icingaweb2::params::package_install_options,
      }
    }
  }
}
