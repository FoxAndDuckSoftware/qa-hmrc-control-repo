# == Class: profile::elasticsearch::logstash
#
# Defines what is required for the logstash instance. 
class profile::elasticsearch::logstash {
    class { 'logstash' :
		manage_repo  => true,
		java_install => false,
	}
# Defines the Config files for the Inputs to logstash
# Inputs from the localhost are defined in the input_file 
	logstash::configfile { 'input_file' :
		source  => 'puppet:///manifests/files/input_file',
		order   => 10,
	}
#Inputs from remote hosts will be transported using beats
	logstash::configfile { 'input_beats' () :
		template => 'puppet:///site/profile/manifests/templates/input_beats.epp',
		order    => 11,
	}
# Defines the Config files for the filters for the various inputs
# Filters for non role specific log monitoring e.g syslog
	logstash::configfile { 'filters_gen' :
		source => 'puppet:///site/profile/manifests/files/filters_gen',
		order  => 20,
	}
# Filters for Pega Boxes
	logstash::configfile { 'filters_pega' :
		source => 'puppet:///site/profile/manifests/files/filters_gen',
		order  => 21,
	}
# Filters for Documentum boxes 
#	logstash::configfile { 'filters_doc' :
#		source => 'puppet:///site/profile/manifests/files/filters_doc',
#		order  => 22,
#	}
# Defines the config file used for the output to elasticsearch
	logstash::configfile { 'output_es' ():
		template => 'puppet:///site/profile/manifests/templates/output_es.epp'
		order    => 30,
	}
# Defines the source for custom grok patterns used by the filters.
	logstash::patternfile { 'extra_patterns' :
		source => 'puppet:///site/profile/manifests/files/extra_patterns',
	}
	
}