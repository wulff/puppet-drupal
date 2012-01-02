class tuningprimer {
  exec {
    'download-tuning-primer':
      command => 'wget -O /opt/tuning-primer.sh http://launchpad.net/mysql-tuning-primer/trunk/1.6-r1/+download/tuning-primer.sh',
      creates => '/opt/tuning-primer.sh';
  }
  file {
    '/usr/local/bin/tuning-primer.sh':
      ensure => '/opt/tuning-primer.sh',
      require => Exec['download-tuning-primer'];
    '/opt/tuning-primer.sh':
      ensure => present,
      mode => 0755,
      require => Exec['download-tuning-primer'];
  }
}
