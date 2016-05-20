# == Class: role::elasticsearch::elasticsearch
#
# Defines a role that installs and configures gitlab-ce
class role::elasticsearch::elasticsearch {
    include ::profile::java::oracle::eight
	include ::profile::elasticsearch::elasticsearch
}
