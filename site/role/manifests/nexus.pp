# == Class: role::nexus
#
class role::nexus {
    include ::profile::java::oracle::eight
    include ::profile::nexus
}
