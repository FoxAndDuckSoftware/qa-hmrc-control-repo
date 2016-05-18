# == Class: profile::nexus
#
class profile::nexus {
    class { '::nexus':
        version    => '2.13.0',
        revision   => '01',
        nexus_root => '/opt'
    }
    class { '::nginx': }
    nginx::resource::vhost { 'nexus':
        ensure         => present
    }
    nginx::resource::location { 'nexus':
        ensure         => present,
        location       => '/',
        location_alias => 'nexus',
        vhost          => 'nexus',
        proxy          => "http://${::nexus::nexus_host}:${::nexus::nexus_port}"
    }
}
