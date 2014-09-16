# == Class: haproxy::config
#
# test
class haproxy::config inherits haproxy {

  file { '/etc/haproxy/haproxy.cfg':
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('haproxy/haproxy.cfg.erb'),
    notify  => Service[haproxy],
  }
}
