class icingaweb2::params {
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
  $default_confdir              = '/etc/icingaweb2'
  $system_mod_dir               = '/usr/share/icingaweb2/modules'
  $conf_mod_dir                 = "${default_confdir}/enabledModules"
  $mods                         = []

  $mods_files                   = {'monitoring' => ['backends','config','instances']}
  
  $conf_files                   = ['authentication', 'config', 'resources', 'roles']
  $mysql_packages               = ['php-mysql', 'php-ZendFramework-Db-Adapter-Pdo-Mysql']
  $pgsql_packages               = ['php-pgsql', 'php-ZendFramework-Db-Adapter-Pdo-Pgsql']
}
