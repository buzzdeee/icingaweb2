# This defined type takes care to
# maintain users dashboards

define icingaweb2::dashboard (
  $user,
  $dashlets,
  $order = '10',
  $ensure = 'present',
) {

  $dashboard = $title

  $confdir = "${icingaweb2::params::default_confdir}/dashboards/${user}"
  if ! defined(Common::Mkdir_p[$confdir]) {
    common::mkdir_p{ $confdir: }
  }

  if ! defined(Concat["${confdir}/dashboard.ini"]) {
    concat { "${confdir}/dashboard.ini":
      ensure => $ensure,
    }
  }

  concat::fragment { "icingaweb2_dashboard_${user}_header":
    target  => "${confdir}/dashboard.ini",
    order   => '01',
    content => template('icingaweb2/header.erb'), 
  }

  concat::fragment { "icingaweb2_dashboard_${user}_${title}":
    target  => "${confdir}/dashboard.ini",
    order   => $order,
    content => template('icingaweb2/dashboard.erb'), 
  }

}
