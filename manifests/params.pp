# The (os-dependent) default values for the module
class icingaweb2::params {
  case $::osfamily {
    'RedHat': {
      $with_repo               = true
      $default_confdir         = '/etc/icingaweb2'
      $system_mod_dir          = '/usr/share/icingaweb2/modules'
      $package_names           = [ 'icingaweb2', 'php-pdo' ]
      $package_install_options = undef
      $php_packages_ensure     = undef
      $php_packages_prefix     = undef
      $mysql_packages          = ['php-mysql', 'php-ZendFramework-Db-Adapter-Pdo-Mysql']
      $pgsql_packages          = ['php-pgsql', 'php-ZendFramework-Db-Adapter-Pdo-Pgsql']
      $sysgroup                = 'root'
    }
    'OpenBSD': {
      $with_repo               = false
      $default_confdir         = '/var/www/etc/icingaweb2'
      $system_mod_dir          = '/icinga-web2/modules'
      $package_names           = [ 'icinga-web2', ]
      $package_install_options = '-z'
      $php_packages_ensure     = '5.6.20'
      $php_packages_prefix     = 'php-'
      $mysql_packages          = ['php-mysql', 'php-pdo_mysql']
      $pgsql_packages          = ['php-pgsql', 'php-pdo_pgsql']
      $sysgroup                = '_icingaweb2'
    }
    default: {
      fail("${::module_name} does not support osfamily: ${::osfamily}")
    }
  }

  $mysql_default_port           = '3306'
  $pgsql_default_port           = '5432'
  $dbwebtype                    = 'mysql'
  $dbwebhost                    = 'localhost'
  $dbwebuser                    = 'icinga_web'
  $dbwebpasswd                  = 'icinga_web'
  $dbwebname                    = 'icinga_web'

  $dbtype                       = 'mysql'
  $dbhost                       = 'localhost'
  $dbuser                       = 'icinga'
  $dbpasswd                     = 'icinga'
  $dbname                       = 'icinga'
  $conf_mod_dir                 = "${default_confdir}/enabledModules"

  $log_type                      = 'syslog'
  $log_level                     = 'ERROR'
  $log_application               = 'icingaweb2'

  $auth_backend                  = 'db'
  $auth_resource                 = "icingaweb_${auth_backend}"
  $ldap_user_class               = 'inetOrgPerson'
  $ldap_user_filter              = undef
  $ldap_user_attribute           = 'uid'
  $ldap_user_base_dn             = undef
  $group_backend                 = 'db'
  $group_resource                = "icingaweb_${group_backend}"
  $ldap_group_class              = 'group'
  $ldap_group_filter             = undef
  $ldap_group_attribute          = 'gid'
  $ldap_group_member_attribute   = 'member'
  $ldap_group_base_dn            = undef

  $ldap_host                     = 'localhost'
  $ldap_port                     = '389'
  $ldap_encryption               = 'none'
  $ldap_root_dn                  = undef
  $ldap_bind_dn                  = undef
  $ldap_bind_pw                  = undef

  $pref_store                    = 'db'
  $pref_resource                 = "icingaweb_${pref_store}"

  $show_stacktraces              = '0'
  $config_backend                = 'db'
  $config_resource               = "icingaweb_${config_backend}"

  $roles_admin_users             = 'admin'
  $roles_admin_perms             = '*'

  $module_files                  = { 'monitoring' => [ 'backends', 'config', 'commandtransports' ],
                                     'pnp' => [ 'config' ],
                                     'doc' => [],
                                     'iframe' => [],
                                     'businessprocess' => [],
                                   }
  
}
