define icingaweb2::module (
  $git_url = undef,
  $params = undef,
) {

  require icingaweb2::configure

  unless $title in keys($::icingaweb2::params::module_files) {
    fail("${::module_name}: unsupported module: ${title}")
  }

  if $title == 'monitoring' {
    validate_hash($params['config'])
    validate_hash($params['commandtransports'])
    validate_hash($params['backends'])
  }

  file {"icingaweb2_module_link_${title}":
    ensure => 'link',
    path   => "${icingaweb2::params::conf_mod_dir}/${title}",
    target => "${icingaweb2::params::system_mod_dir}/${title}",
  }

  # This is an external module, download it with vcsrepo
  # module and install:
  if $git_url {
    vcsrepo { "/var/www/icinga-web2/modules/${title}":
      ensure   => 'present',
      provider => 'git',
      source   => $git_url,
    }
  }

  if $params {
    if $title == 'businessprocess' {
      file { "${icingaweb2::params::default_confdir}/modules/${title}":
        ensure => 'directory',
      }
      file { "${icingaweb2::params::default_confdir}/modules/${title}/processes":
        ensure => 'directory',
      }
      $params.each |String $process, Hash $values| {
        file { "${icingaweb2::params::default_confdir}/modules/${title}/processes/${process}.conf":
          content => template('icingaweb2/businessprocess.erb')
        }
      }
    } else {
      file { "${icingaweb2::params::default_confdir}/modules/${title}":
        ensure => 'directory',
      }
      $::icingaweb2::params::module_files[$title].each |$file| {
        concat {"icingaweb2_module_${title}_${file}":
          owner   => 'root',
          group   => $icingaweb2::params::sysgroup,
          mode    => '0660',
          path    => "${icingaweb2::params::default_confdir}/modules/${title}/${file}.ini",
          require => File["${icingaweb2::params::default_confdir}/modules/${title}"],
        }
        concat::fragment { "icingaweb2_module_${title}_${file}_ini_header":
          content => template('icingaweb2/header.erb'),
          order   => '00',
          target  => "icingaweb2_module_${title}_${file}",
        }
        $params[$file].each |$key, $values| {
          concat::fragment { "icingaweb2_module_${title}_${file}_${key}":
            content => template("icingaweb2/modules/${title}/${file}.erb"),
            order   => '10',
            target  => "icingaweb2_module_${title}_${file}",
          }
        }
      }
    }
  }
}
