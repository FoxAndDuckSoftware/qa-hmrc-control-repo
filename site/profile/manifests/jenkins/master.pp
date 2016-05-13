# == Class: profile::jenkins::master
#
class profile::jenkins::master {
    include ::yum::repo::jenkins
    package { 'jenkins':
        ensure => 'latest',
    } ~>
    service { 'jenkins':
        ensure     => running,
        enable     => true,
        hasrestart => true,
        hasstatus  => true,
    }

    class { 'nginx': }
}
