# == Class: profile::base
#
# Base profile for all agents
class profile::base {
    class { '::ntp': }
    class { '::hosts': }
    class { '::yum':
        extrarepo => [ 'epel' , 'puppetlabs' ],
    }
}
