class icingaweb2::params {
  $dbwebtype                    = 'mysql'
  $dbwebhost                    = 'localhost'
  $dbwebport                    = '3306'
  $dbwebuser                    = 'icinga_web'
  $dbwebpasswd                  = 'icinga_web'
  $dbwebname                    = 'icinga_web'

  $dbtype                    = 'mysql'
  $dbhost                    = 'localhost'
  $dbport                    = '3306'
  $dbuser                    = 'icinga'
  $dbpasswd                  = 'icinga'
  $dbname                    = 'icinga'

  $default_icingaweb_confdir = '/etc/icingaweb2'

  $conf_files=['authentication', 'config', 'resources', 'roles']
  
}
