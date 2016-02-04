# == Class: icingaweb2
#
# Full description of class icingaweb2 here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'icingaweb2':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#

class icingaweb2 (
#  $auth_backend = $icingaweb2::params::auth_backend,
#  $auth_resource = $icingaweb2::params::auth_resource,
#  $dbwebtype    = $icingaweb2::params::dbwebtype,
#  $dbwebhost    = $icingaweb2::params::dbwebhost,
#  $dbwebport    = undef,
#  $dbwebuser    = $icingaweb2::params::dbwebuser,
#  $dbwebpasswd  = $icingaweb2::params::dbwebpasswd,
#  $dbwebname    = $icingaweb2::params::dbwebname,
#  $dbtype       = $icingaweb2::params::dbtype,
#  $dbhost       = $icingaweb2::params::dbhost,
#  $dbport       = undef,
#  $dbuser       = $icingaweb2::params::dbuser,
#  $dbpasswd     = $icingaweb2::params::dbpasswd,
#  $dbname       = $icingaweb2::params::dbname,
  $with_repo    = $icingaweb2::params::with_repo,
  $modules      = $icingaweb2::params::modules,
  $sysgroup     = $icingaweb2::params::sysgroup,
  $log_level    = $icingaweb2::params::log_level,
  $log_type     = $icingaweb2::params::log_type,
  $log_application = $icingaweb2::params::log_application,
  $pref_store = $icingaweb2::params::pref_store,
  $pref_resource = $icingaweb2::params::pref_resource,
  $roles_admin_users = $icingaweb2::params::roles_admin_users,
  $roles_admin_perms = $icingaweb2::params::roles_admin_perms,
  $show_stacktraces = $icingaweb2::params::show_stacktraces,
  $config_backend = $icingaweb2::params::config_backend,
  $config_resource = $icingaweb2::params::config_resource,
#  $ldap_user_class = $icingaweb2::params::ldap_user_class,
#  $ldap_user_filter = $icingaweb2::params::ldap_user_filter,
#  $ldap_user_attribute = $icingaweb2::params::ldap_user_attribute,
#  $ldap_user_base_dn = $icingaweb2::params::ldap_user_base_dn,
  $group_backend = $icingaweb2::params::group_backend,
  $group_resource = $icingaweb2::params::group_resource,
  $group_user_backend = undef,
  $ldap_group_class = $icingaweb2::params::ldap_group_class,
  $ldap_group_filter = $icingaweb2::params::ldap_group_filter,
  $ldap_group_attribute = $icingaweb2::params::ldap_group_attribute,
  $ldap_group_member_attribute = $icingaweb2::params::ldap_group_member_attribute,
  $ldap_group_base_dn = $icingaweb2::params::ldap_group_base_dn,
#  $ldap_host = $icingaweb2::params::ldap_host,
#  $ldap_port = $icingaweb2::params::ldap_port,
#  $ldap_encryption = $icingaweb2::params::ldap_encryption,
#  $ldap_root_dn = $icingaweb2::params::ldap_root_dn,
#  $ldap_bind_dn = $icingaweb2::params::ldap_bind_dn,
#  $ldap_bind_pw = $icingaweb2::params::ldap_bind_pw,
) inherits icingaweb2::params {

  case $::osfamily {
    'RedHat': {
      Class[icingaweb2::yumrepo] -> Class[icingaweb2::package]

      class{ 'icingaweb2::yumrepo': }
    }
    default: {
      # deliberately left empty
    }
  }

  class{ 'icingaweb2::package': }
  class{ 'icingaweb2::configure':
#    auth_backend   => $auth_backend,
#    auth_resource => $auth_resource,
#    dbwebtype   => $dbwebtype,
#    dbwebhost   => $dbwebhost,
#    dbwebport   => $real_dbwebport,
#    dbwebuser   => $dbwebuser,
#    dbwebpasswd => $dbwebpasswd,
#    dbwebname   => $dbwebname,
#    dbtype      => $dbtype,
#    dbhost      => $dbhost,
#    dbport      => $real_dbport,
#    dbuser      => $dbuser,
#    dbpasswd    => $dbpasswd,
#    dbname      => $dbname,
    sysgroup    => $sysgroup,
    log_type => $log_type,
    log_level => $log_level,
    log_application => $log_application,
    pref_store => $pref_store,
    pref_resource => $pref_resource,
#    roles_admin_users => $roles_admin_users,
#    roles_admin_perms => $roles_admin_perms,
    show_stacktraces => $show_stacktraces,
    config_backend => $config_backend,
    config_resource => $config_resource,
#    ldap_user_class => $ldap_user_class,
#    ldap_user_filter => $ldap_user_filter,
#    ldap_user_attribute => $ldap_user_attribute,
#    ldap_user_base_dn => $ldap_user_base_dn,
    group_backend => $group_backend,
    group_resource => $group_resource,
    group_user_backend => $group_user_backend,
    ldap_group_class => $ldap_group_class,
    ldap_group_filter => $ldap_group_filter,
    ldap_group_attribute => $ldap_group_attribute,
    ldap_group_member_attribute => $ldap_group_member_attribute,
    ldap_group_base_dn => $ldap_group_base_dn,
#    ldap_host => $ldap_host,
#    ldap_port => $ldap_port,
#    ldap_encryption => $ldap_encryption,
#    ldap_root_dn => $ldap_root_dn,
#    ldap_bind_dn => $ldap_bind_dn,
#    ldap_bind_pw => $ldap_bind_pw,
  }
  class{ 'icingaweb2::modules': }
  
  Class[icingaweb2::package]->
  Class[icingaweb2::configure]->
  Class[icingaweb2::modules]
}
