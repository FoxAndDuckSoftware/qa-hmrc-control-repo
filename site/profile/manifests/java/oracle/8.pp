# == Class: profile::java
#
class profile::java::oracle::8 {
    class { '::java::oracle':
        ensure  => 'present',
        version => '8',
        java_se => 'jdk'
    }
}
