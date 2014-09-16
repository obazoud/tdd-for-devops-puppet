# == Class: haproxy::install
#
#
class haproxy::install inherits haproxy {

  package { 'haproxy':
    ensure  => present
  }

}
