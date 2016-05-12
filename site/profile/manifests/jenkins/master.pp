# == Class: profile::jenkins::master
#
class profile::jenkins::master {
    class { '::yum':
        extrarepo => ['jenkins'],
    } ->
    package { 'jenkins':
        ensure => 'latest',
    } ~>
    service { 'jenkins':
        ensure     => running,
        enable     => true,
        hasrestart => true,
        hasstatus  => true,
    }
}
