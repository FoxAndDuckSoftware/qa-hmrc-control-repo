# == Class: role::elasticsearch::logstash
#
# Defines a role that installs and configures gitlab-ce
class role::elasticsearch::logstash {
    include ::profile::java::oracle::eight
	include ::profile::elasticsearch::logstash
}
