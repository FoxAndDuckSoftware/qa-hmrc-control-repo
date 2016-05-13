# == Class: role::jenkins::master
#
class role::jenkins::master {
    include ::profile::java::oracle::eight
    include ::profile::jenkins::master
}
