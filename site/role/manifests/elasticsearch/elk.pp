# == Class: role::elasticsearch::elk
#
# Defines a role that installs and configures gitlab-ce
class role::elasticsearch::elk {
    include ::profile::java::oracle::eight
	include ::profile::elasticsearch::elasticsearch
	include ::profile::elasticsearch::logstash
	include ::profile::elasticsearch::kibana
}
