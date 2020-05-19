# Class: vision_logrotate
# ===========================
#
# Profile to manage custom logrotate config
#
# Parameters
# ----------
#

class vision_logrotate {

  package { 'logrotate':
    ensure => present,
  }

  file { '/etc/logrotate.d/traefik':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => file('vision_logrotate/traefik'),
  }

  file { '/etc/logrotate.d/firewall':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => file('vision_logrotate/firewall'),
  }

  file { '/etc/logrotate.d/applications':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => file('vision_logrotate/applications'),
  }

}
