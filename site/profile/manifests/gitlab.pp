# == Class: profile::gitlab
#
# Defines what is required for the gitlab instance.
class profile::gitlab( $externalurl = $::servername ) {
    class { '::gitlab':
        external_url => "http://${externalurl}"
    }
}
