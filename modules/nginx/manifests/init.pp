class nginx {
  package {
    'nginx-light':
      ensure => present,
      require => Exec['ppa-update']
  }

  service {
    'nginx':
      enable => true,
      ensure => running,
      require => Package['nginx-light']
  }

  file {
    '/var/cache/nginx/':
      ensure => directory;
    '/var/www':
      ensure => directory;

    '/etc/nginx/nginx.conf':
      source => 'puppet:///modules/nginx/nginx.conf',
      require => Package['nginx-light'],
      notify => Service['nginx'];
    '/etc/nginx/conf.d/fastcgi.conf':
      source => 'puppet:///modules/nginx/fastcgi.conf',
      require => Package['nginx-light'],
      notify => Service['nginx'];
    '/etc/nginx/conf.d/map_cache.conf':
      source => 'puppet:///modules/nginx/map_cache.conf',
      require => Package['nginx-light'],
      notify => Service['nginx'];
    '/etc/nginx/conf.d/microcache.conf':
      source => 'puppet:///modules/nginx/microcache.conf',
      require => Package['nginx-light'],
      notify => Service['nginx'];
    '/etc/nginx/conf.d/upstream.conf':
      source => 'puppet:///modules/nginx/upstream.conf',
      require => Package['nginx-light'],
      notify => Service['nginx'];
    '/etc/nginx/sites-available/drupal.conf':
      source => 'puppet:///modules/nginx/drupal.conf',
      require => Package['nginx-light'];
    '/etc/nginx/sites-available/admin.conf':
      source => 'puppet:///modules/nginx/admin.conf',
      require => Package['nginx-light'];
    '/etc/nginx/htpasswd':
      source => 'puppet:///modules/nginx/htpasswd',
      require => Package['nginx-light'];

    '/etc/nginx/sites-enabled/default':
      ensure => absent,
      require => Package['nginx-light'],
      notify => Service['nginx'];

    '/etc/nginx/sites-available/default':
      source => 'puppet:///modules/nginx/default.conf',
      require => Package['nginx-light'],
      notify => Service['nginx'];
    '/etc/nginx/sites-enabled/000-default':
      ensure => '/etc/nginx/sites-available/default',
      require => File['/etc/nginx/sites-available/default'];

    '/etc/nginx/sites-available/cdn.conf':
      source => 'puppet:///modules/nginx/cdn.conf',
      require => Package['nginx-light'],
      notify => Service['nginx'];
    '/etc/nginx/sites-enabled/cdn.conf':
      ensure => '/etc/nginx/sites-available/cdn.conf',
      require => File['/etc/nginx/sites-available/cdn.conf'];

    '/etc/nginx/sites-available/drupal7.conf':
      source => 'puppet:///modules/nginx/drupal7.conf',
      require => Package['nginx-light'],
      notify => Service['nginx'];
    '/etc/nginx/sites-enabled/drupal7.conf':
      ensure => '/etc/nginx/sites-available/drupal7.conf',
      require => File['/etc/nginx/sites-available/drupal7.conf'];
  }
}
