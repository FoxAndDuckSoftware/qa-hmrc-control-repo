# == Class: profile::filebeat
#
class profile::filebeat (Array $logstash_hosts = [ "localhost:5044" ],) {
	class { 'filebeat' : 
		outputs => {
			'logstash' => {
				'hosts' => $logstash_hosts,
				'loadbalance' => true,
			},	
		},
	}
}