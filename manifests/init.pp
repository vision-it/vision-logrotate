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

  file { '/etc/logrotate.conf':
    ensure  => present,
    mode    => '0644',
    content => file('vision_logrotate/logrotate.conf'),
    require => Package['logrotate'],
  }

  file { '/etc/logrotate.custom.d':
    ensure  => directory,
    recurse => true,
    purge   => true,
    mode    => '1755',
    source  => 'puppet:///modules/vision_logrotate/logrotate.d/',
    require => Package['logrotate'],
  }

}
