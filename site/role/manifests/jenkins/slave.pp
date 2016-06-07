# == Class: role::jenkins::slave
#
class role::jenkins::slave {
  include profile::java::oracle::eight
  include profile::jenkins::slave
}
