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
  $with_repo    = $icingaweb2::params::with_repo,
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
  $group_backend = $icingaweb2::params::group_backend,
  $group_resource = $icingaweb2::params::group_resource,
  $group_user_backend = undef,
  $dbwebtype = $icingaweb2::params::dbwebtype,
  $ldap_group_class = $icingaweb2::params::ldap_group_class,
  $ldap_group_filter = $icingaweb2::params::ldap_group_filter,
  $ldap_group_attribute = $icingaweb2::params::ldap_group_attribute,
  $ldap_group_member_attribute = $icingaweb2::params::ldap_group_member_attribute,
  $ldap_group_base_dn = $icingaweb2::params::ldap_group_base_dn,
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
    sysgroup    => $sysgroup,
    log_type => $log_type,
    log_level => $log_level,
    log_application => $log_application,
    pref_store => $pref_store,
    pref_resource => $pref_resource,
    show_stacktraces => $show_stacktraces,
    config_backend => $config_backend,
    config_resource => $config_resource,
    group_backend => $group_backend,
    group_resource => $group_resource,
    group_user_backend => $group_user_backend,
    ldap_group_class => $ldap_group_class,
    ldap_group_filter => $ldap_group_filter,
    ldap_group_attribute => $ldap_group_attribute,
    ldap_group_member_attribute => $ldap_group_member_attribute,
    ldap_group_base_dn => $ldap_group_base_dn,
  }
  
  Class[icingaweb2::package]->
  Class[icingaweb2::configure]
}
