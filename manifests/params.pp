# The (os-dependent) default values for the module
class icingaweb2::params {
  case $::osfamily {
    'RedHat': {
      $with_repo               = True
      $default_confdir         = '/etc/icingaweb2'
      $system_mod_dir          = '/usr/share/icingaweb2/modules'
      $package_names           = [ 'icingaweb2', 'php-pdo' ]
      $package_install_options = undef
      $mysql_packages          = ['php-mysql', 'php-ZendFramework-Db-Adapter-Pdo-Mysql']
      $pgsql_packages          = ['php-pgsql', 'php-ZendFramework-Db-Adapter-Pdo-Pgsql']
    }
    'OpenBSD': {
      $with_repo               = False
      $default_confdir         = '/var/www/etc/icingaweb2'
      $system_mod_dir          = '/var/www/icinga-web2/modules'
      $package_names           = [ 'icinga-web2', 'php-gd-5.6*' ]
      $package_install_options = '-z'
      $mysql_packages          = ['php-mysql-5.6*', 'php-pdo_pgsql-5.6*']
      $pgsql_packages          = ['php-pgsql-5.6*', 'php-pdo_pgsql-5.6*']
    }
    default: {
      fail("${::module_name} does not support osfamily: ${::osfamily}")
    }
  }
  $dbwebtype                    = 'mysql'
  $dbwebhost                    = 'localhost'
  $dbwebport                    = '3306'
  $dbwebuser                    = 'icinga_web'
  $dbwebpasswd                  = 'icinga_web'
  $dbwebname                    = 'icinga_web'

  $dbtype                       = 'mysql'
  $dbhost                       = 'localhost'
  $dbport                       = '3306'
  $dbuser                       = 'icinga'
  $dbpasswd                     = 'icinga'
  $dbname                       = 'icinga'
  $conf_mod_dir                 = "${default_confdir}/enabledModules"
  $modules                      = []

  $module_files                   = {'monitoring' => ['backends','config','instances']}
  
  $conf_files                   = ['authentication', 'config', 'resources', 'roles']
}
