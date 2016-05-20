# == Class: profile::postgresql
#
class profile::postgresql {
    class { '::postgresql::server': }
}
