class mysql {
  package {
    ['mysql-common', 'mysql-client', 'mysql-server']:
      ensure => present
  }
  service {
    'mysql':
      enable => true,
      ensure => running,
      require => Package['mysql-server']
  }
  exec {
    'set-root-password':
      subscribe => [Package['mysql-common'], Package['mysql-client'], Package['mysql-server']],
      refreshonly => true,
      unless => "mysqladmin -uroot -p$mysql_password status",
      command => "mysqladmin -uroot password $mysql_password",
      require => Package['mtop'] # mtop needs an empty root password
  }
}
