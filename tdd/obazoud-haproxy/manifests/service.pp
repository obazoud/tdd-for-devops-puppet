# == Class: haproxy::service
#
#
class haproxy::service inherits haproxy {

  service { 'haproxy':
      ensure     => 'running',
      enable     => true,
      name       => 'haproxy',
      hasrestart => true,
      hasstatus  => true
    }

}
