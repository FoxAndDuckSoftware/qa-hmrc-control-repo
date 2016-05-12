# == Class: role::jenkins::master
#
class role::jenkins::master {
    include ::profile::java::oracle::8
    include ::profile::jenkins::master
}
