# == Class: profile::filebeat::filebeat_pega
#
class profile::filebeat::filebeat_pega {
	class { 'filebeat' : }
	
	filebeat::prospector {
		paths    => '/opt/app/cfs/live/*s[vu][rp]*/logs/PegaBIX.log',
		doc_type => 'pega_cfs_bix_log',
	}
	filebeat::prospector {
		paths    => 'opt/app/cfs/live/*s[vu][rp]*/logs/PegaRULES-ALERT.log',
		doc_type => 'pega_cfs_rules_alert',
	}
	filebeat::prospector {
		paths    => '/opt/app/cfs/live/*s[vu][rp]*/log/PegaRULES-ALERTSECURITY.log',
		doc_type => 'pega_cfs_rules_alert_security',
	}
	filebeat::prospector {
		paths    => '/opt/app/cfs/live/*s[vu][rp]*/logs/PegaRULES.log',
		doc_type => 'pega_cfs_rules',
	}
	filebeat::prospector {
		paths    => '/opt/app/cfs/live/*s[vu][rp]*/logs/catalina.out',
		doc_type => 'cfs_catalina_out',
	}
	filebeat::prospector {
		paths    => '/opt/app/cfs/live/*s[vu][rp]*/logs/*s[vu][rp]*__gcstats.*.log',
		doc_type => 'cfs_gc_stats',
	}
}