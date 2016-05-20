# == Class: role::elasticsearch::elk
#
# Defines a role that installs and configures gitlab-ce
class role::elasticsearch::elk {
    include ::profile::java::oracle::eight
	include ::profile::elasticsearch::kibana
}
