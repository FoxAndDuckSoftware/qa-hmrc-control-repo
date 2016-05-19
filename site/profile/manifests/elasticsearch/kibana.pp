# == Class: profile::elasticsearch::kibana
#
# Defines what is required for the elasticsearch instance.

class profile::elasticsearch::kibana ( Numeric $port = 5601,
									   String $es_url = "http://localhost:9200",
									   ) {
	class { 'kibana' : 
		port => $port,
		es_url => $es_url
	}
}