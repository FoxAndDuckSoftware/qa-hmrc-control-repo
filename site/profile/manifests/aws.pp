# == Class: profile::aws
#
class profile::aws {
    file_line { 'disable set_hostname':
        ensure => present,
        path   => '/etc/cloud/cloud.cfg',
        line   => '# - set_hostname',
        match  => ' - set_hostname'
    }
    file_line { 'disable update_hostname':
        ensure => present,
        path   => '/etc/cloud/cloud.cfg',
        line   => '# - update_hostname',
        match  => ' - update_hostname'
    }
}
