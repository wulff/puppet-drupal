class mysqltuner {
  exec {
    'download-mysqltuner':
      command => 'wget -O /opt/mysqltuner.pl https://raw.github.com/rackerhacker/MySQLTuner-perl/master/mysqltuner.pl',
      creates => '/opt/mysqltuner.pl';
  }
  file {
    '/usr/local/bin/mysqltuner.pl':
      ensure => '/opt/mysqltuner.pl',
      require => Exec['download-mysqltuner'];
    '/opt/mysqltuner.pl':
      ensure => present,
      mode => 0755,
      require => Exec['download-mysqltuner'];
  }
}
