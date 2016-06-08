# == Class: profile::tomcat
#
class profile::pega ($ruleshost, $rulesport, $rulessid, $rulesuser, $rulespass,
  $dualuser = true, $adminhost, $adminport, $adminsid, $adminuser,
  $adminpass, $tomcatadminpass, $nexusdomain, $warpresence = true) {
  package { 'tomcat7':
    ensure => latest,
  }

  class { '::tomcat':}
  tomcat::setenv::entry { 'JAVA_OPTS':
    value => '-Xms4096m -Xmx4096m -XX:PermSize512m -XX:MaxPermSize1024m -Djava.awt.headless=true'
  }

  tomcat::config::context::resource { 'jdbc/PegaRULES':
    ensure                => 'present',
    resource_type         => 'javax.sql.DataSource',
    additional_attributes => {
      'auth'            => 'Container',
      'driverClassName' => 'oracle.jdbc.OracleDriver',
      'url'             => "jdbc:oracle:thin:@//${ruleshost}:${rulesport}/${rulessid}",
      'username'        => $rulesuser,
      'password'        => $rulespass,
      'maxActive'       => '100',
      'maxIdle'         => '30',
      'maxWait'         => '10000'
    }
  }

  tomcat::config::context::resource { 'jdbc/AdminPegaRULES':
    ensure                => $dualuser,
    resource_type         => 'javax.sql.DataSource',
    additional_attributes => {
      'auth'            => 'Container',
      'driverClassName' => 'oracle.jdbc.OracleDriver',
      'url'             => "jdbc:oracle:thin:@//${adminhost}:${adminport}/${adminsid}",
      'username'        => $adminuser,
      'password'        => $adminpass,
      'maxActive'       => '10',
      'maxIdle'         => '5',
      'maxWait'         => '5000'
    }
  }

  tomcat::config::server::tomcat_users { 'admin-gui':
    element => 'role'
  }

  tomcat::config::server::tomcat_users { 'manager-gui':
    element => 'role'
  }

  tomcat::config::server::tomcat_users { 'PegaDiagnosticUser':
    element => 'role'
  }

  tomcat::config::server::tomcat_users { 'admin':
    element  => 'user',
    password => $tomcatadminpass,
    roles    => ['admin-gui', 'manager-gui', 'PegaDiagnosticUser']
  }

  tomcat::war { 'prweb.war':
    war_ensure => $warpresence,
    war_source => "http://${nexusdomain}/${name}"
  }

  tomcat::war { 'prsysmgmt.war':
    war_ensure => $warpresence,
    war_source => "http://${nexusdomain}/${name}"
  }

  tomcat::war { 'prhelp.war':
    war_ensure => $warpresence,
    war_source => "http://${nexusdomain}/${name}"
  }
}
