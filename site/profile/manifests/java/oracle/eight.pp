# == Class: profile::java
#
class profile::java::oracle::eight {
    ::java::oracle { 'jdk8' :
        ensure  => 'present',
        version => '8',
        java_se => 'jdk'
    }
}
