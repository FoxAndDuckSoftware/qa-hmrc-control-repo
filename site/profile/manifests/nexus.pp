# == Class: profile::nexus
#
class profile::nexus ($tarloc = $::nexus::params::download_site) {

  file { '/opt/nexus':
    ensure => directory,
    owner  => 'nexus',
    group  => 'nexus'
  }

  class { '::nexus':
      version       => '2.13.0',
      revision      => '01',
      nexus_root    => '/opt/nexus',
      download_site => $tarloc
  }

  package { [ 'createrepo', 'mergerepo' ]:
    ensure => latest,
  }

  class { '::nginx': }
  ::nginx::resource::vhost { '_':
      ensure => present,
      proxy  => "http://${::nexus::nexus_host}:${::nexus::nexus_port}"
  }
}
