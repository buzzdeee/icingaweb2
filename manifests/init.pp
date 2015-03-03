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
  $dbwebtype   = $icingaweb2::params::dbwebtype,
  $dbwebhost   = $icingaweb2::params::dbwebhost,
  $dbwebport   = $icingaweb2::params::dbwebport,
  $dbwebuser   = $icingaweb2::params::dbwebuser,
  $dbwebpasswd = $icingaweb2::params::dbwebpasswd,
  $dbwebname   = $icingaweb2::params::dbwebname,
  $dbtype      = $icingaweb2::params::dbtype,
  $dbhost      = $icingaweb2::params::dbhost,
  $dbport      = $icingaweb2::params::dbport,
  $dbuser      = $icingaweb2::params::dbuser,
  $dbpasswd    = $icingaweb2::params::dbpasswd,
  $dbname      = $icingaweb2::params::dbname,
  $with_repo   = $icingaweb2::params::with_repo,
  $modules     = $icingaweb2::params::modules
) inherits icingaweb2::params {

  case $::osfamily {
    RedHat: {
      
      Class[icingaweb2::yumrepo] -> Class[icingaweb2::package] -> Class[icingaweb2::configure] -> Class[icingaweb2::modules]

      class{ 'icingaweb2::yumrepo': }
      class{ 'icingaweb2::package': }
      class{ 'icingaweb2::configure': }
      class{ 'icingaweb2::modules': }
    }
    
    default: { fail("Currently unavailable for ${osfamily}") }
  }
  
}
