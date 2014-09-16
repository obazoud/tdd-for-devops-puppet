# == Class: haproxy
#
#
class haproxy (
    $admin = $haproxy::params::admin,
  ) inherits haproxy::params {

    class { 'haproxy::install': }
    class { 'haproxy::config': }
    class { 'haproxy::service': }

}
