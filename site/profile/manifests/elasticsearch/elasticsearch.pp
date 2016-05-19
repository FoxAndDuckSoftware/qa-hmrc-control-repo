# == Class: profile::elasticsearch::elasticsearch
#
# Defines what is required for the elasticsearch instance.

class profile::elasticsearch::elasticsearch ( Boolean $node_master = true,
											  Boolean $node_data = true,
											  Numeric $minimum_masterNodes = 3
											  Numeric $http_port = 9200,
											) { 

	class { 'elasticsearch' : 
		config           => {
			'node'       => {
				'master' => $node_master,
				'data'   => $node_data,
			}
			'discovery'  => {
				'zen.minimum_master_nodes' => $minimum_masterNodes,
			}
			'http'       => {
				'port'   => $http_port,
			}
		}
	}
}

  