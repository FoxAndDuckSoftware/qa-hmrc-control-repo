# == Class: profile::nexus
#
class profile::nexus {
    class { '::nexus':
        version    => '2.13.0',
        revision   => '01',
        nexus_root => '/opt'
    }
    class { '::nginx': }
    nginx::resource::vhost { '$::ipaddress':
        ensure => present,
        proxy  => "http://${::nexus::nexus_host}:${::nexus::nexus_port}/nexus/"
    }
}
