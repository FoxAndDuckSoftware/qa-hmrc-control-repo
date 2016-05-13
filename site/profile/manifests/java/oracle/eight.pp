# == Class: profile::java
#
class profile::java::oracle::eight {
    class { '::java::oracle':
        ensure  => 'present',
        version => '8',
        java_se => 'jdk'
    }
}
