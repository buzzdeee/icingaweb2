class icingaweb2::package {
  
  package{'icingaweb2':
    ensure => present
  }
  package{'php-pdo':
    ensure => present
  }
  case $icingaweb2::params::dbwebtype {
    'mysql': {
      package{$icingaweb2::params::mysql_packages:
        ensure => installed,
      }
    }
    'pgsql': {
      package{$icingaweb2::params::pgsql_packages:
        ensure => installed,
      }
    }
  }
}
