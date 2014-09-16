# == Class: haproxy::config
#
#
class haproxy::config inherits haproxy {

  file { '/etc/haproxy/haproxy.cfg':
    path    => '/etc/ssh/sshd_config',
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('haproxy/haproxy.cfg.erb'),
    notify  => Service[haproxy],
  }
}
