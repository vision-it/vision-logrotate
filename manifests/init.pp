# Class: vision_logrotate
# ===========================
#
# @example
# contain ::vision_logrotate
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

}
