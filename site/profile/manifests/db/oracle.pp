# == Class: db::oracle
#
class profile::db::oracle {

  group { 'oinstall': gid => 1050 }
  group { 'dba': gid => 1051 }

  class { '::accounts::user': }
  ::accounts::user { 'oracle':
    comment              => 'This user has been created with Puppet',
    home                 => '/home/oracle',
    gid                  => 1051,
    groups               => 'oinstall',
    bash_profile_content => "TMPDIR=\$TMP; export TMPDIR
    ORACLE_BASE=/u01/app/oracle; export ORACLE_BASE
    ORACLE_HOME=\$ORACLE_BASE/product/12.1.0/dbhome_1; export ORACLE_HOME
    ORACLE_SID=orcl; export ORACLE_SID
    PATH=\$ORACLE_HOME/bin:\$PATH; export PATH
    LD_LIBRARY_PATH=\$ORACLE_HOME/lib:/lib:/usr/lib:/usr/lib64;
    export LD_LIBRARY_PATH
    CLASSPATH=\$ORACLE_HOME/jlib:\$ORACLE_HOME/rdbms/jlib; export CLASSPATH"
    }

  class { '::limits': }
  # Reccomended /etc/security/limits.conf values for oracle database
  ::limits::fragment {'oracle/soft/nproc': value => '1024'}
  ::limits::fragment {'oracle/hard/nproc': value => '8192'}
  ::limits::fragment {'oracle/soft/nofile': value => '1024'}
  ::limits::fragment {'oracle/hard/nofile': value => '65536'}

  class { '::sysctl::base':
  # Reccomended sysctl values for oracle database
    values => {
      'fs.aio-max-nr'                => {
        value => '1048576'
      },
      'fs.file-max'                  => {
        value => '6815744'
      },
      'kernel.shmall'                => {
        value => '2097152'
      },
      'kernel.shmmax'                => {
        value => '3966857216'
      },
      'kernel.shmmni'                => {
        value => '4096'
      },
      'kernel.sem'                   => {
        value => '250 32000 100 128'
      },
      'net.ipv4.ip_local_port_range' => {
        value => '9000 65500'
      },
      'net.core.rmem_default'        => {
        value => '262144'
      },
      'net.core.rmem_max'            => {
        value => '4194304'
      },
      'net.core.wmem_default'        => {
        value => '262144'
      },
      'net.core.wmem_max'            => {
        value => '104858'
      }
    }
  }

  # DB Dependencies
  $packages = [ 'binutils.x86_64', 'compat-libcap1.x86_64', 'gcc.x86_64',
  'gcc-c++.x86_64', 'glibc.i686', 'glibc.x86_64', 'glibc-devel.i686',
  'glibc-devel.x86_64', 'ksh', 'compat-libstdc++-33', 'libaio.i686',
  'libaio.x86_64', 'libaio-devel.i686', 'libaio-devel.x86_64', 'libgcc.i686',
  'libgcc.x86_64', 'libstdc++.i686', 'libstdc++.x86_64', 'libstdc++-devel.i686',
  'libstdc++-devel.x86_64', 'libXi.i686', 'libXi.x86_64', 'libXtst.i686',
  'libXtst.x86_64', 'make.x86_64', 'sysstat.x86_64' ]

  package { $packages: ensure => 'present' }
}
