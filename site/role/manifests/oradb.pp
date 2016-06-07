# == Class: role::oradb
#
class role::oradb {
  # resources
  include ::profile::db::oracle
  include ::profile::java::oracle::eight
}
