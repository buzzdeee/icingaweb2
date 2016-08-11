# This defined type stores the
# logo images for services and hosts etc.

define icingaweb2::logo (
  $path = $::icingaweb2::params::system_public_dir,
  $image,
  $ensure = 'present',
) {
  require icingaweb2::configure

  $img_dir = "${path}/img/logos"

  if !defined(File[$img_dir]) {
    file { $img_dir:
      ensure => 'directory',
      owner  => 'root',
      group  => '0',
      mode   => '0755',
    }
  }

  file { "${img_dir}/${title}":
    ensure  => $ensure,
    owner   => 'root',
    group   => '0',
    mode    => '0644',
    content => base64('decode', $image),
  }

}
