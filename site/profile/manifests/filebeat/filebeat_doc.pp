# == Class: profile::filebeat::filebeat_doc
#
class profile::filebeat::filebeat_doc {
	class { 'filebeat' : }
	
	filebeat::prospector {
		paths    => '/opt/app/cfsdmcs/cfsdmcs/dba/log/docbroker*.log',
		doc_type => 'doc_cfs_docbroker',
	}
	filebeat::prospector {
		paths    => '/opt/app/simdmcs/simdmcs/dba/log/docbroker*.log',
		doc_type => 'doc_sim_docbroker',
	}
	filebeat::prospector {
		paths    => '/opt/app/cfsdmcs/cfsdmcs/dba/log/cfsdm.log',
		doc_type => 'dc_cfs_content_server',
	}
	filebeat::prospector {
		paths    => '/opt/app/simdmc/simdmc/dba/log/simdm.log',
		doc_type => 'doc_sim_content_server',
	}
		filebeat::prospector {
		paths    => '/opt/app/cfsdmcs/cfsdmcs/share/jboss7.1.1/server/DctmServer_MethodServer/logs/ServerApps.log',
		doc_type => 'doc_cfs_method_server',
	}
		filebeat::prospector {
		paths    => '/opt/app/simdmcs/simdmcs/share/jboss7.1.1/server/DctmServer_MethodServer/logs/ServerApps.log',
		doc_type => 'doc_sim_method_server',
	}
		filebeat::prospector {
		paths    => '/opt/app/cfsdm/domain01/*s[vu][rp]*/log/Access.*.log',
		doc_type => 'doc_cfs_localhost_access',
	}
}