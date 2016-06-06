# == Class: profile::nexus
#
class profile::nexus {
    class { '::nexus':
        version    => '2.13.0',
        revision   => '01',
        nexus_root => '/opt/nexus'
    }
    class { '::nginx': }
    nginx::resource::vhost { '_':
        ensure => present,
        proxy  => "http://${::nexus::nexus_host}:${::nexus::nexus_port}"
    }
}
