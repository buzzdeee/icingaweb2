# Takes care of package installation
class icingaweb2::package {
  
  $icingaweb2::params::package_names.each |$package| {
    if $icingaweb2::params::php_packages_ensure {
      if $package =~ /^php-/ {
        package{ $package:
          ensure => $icingaweb2::php_packages_ensure,
          install_options => $icingaweb2::params::package_install_options,
        }
      } else {
        package { $package: }
      }
    }
  }

  case $icingaweb2::dbwebtype {
    'mysql': {
      package{$icingaweb2::params::mysql_packages:
        ensure          => $icingaweb2::php_packages_ensure,
        install_options => $icingaweb2::params::package_install_options,
      }
    }
    'pgsql': {
      package{$icingaweb2::params::pgsql_packages:
        ensure          => $icingaweb2::php_packages_ensure,
        install_options => $icingaweb2::params::package_install_options,
      }
    }
  }
}
