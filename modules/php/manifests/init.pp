# todo: notify php-fpm of config file changes
class php {
  # install order is important to avoid apache2 being installed to provide
  # the virtual package phpapi-20090626+lfs
  package {
    'php5-cli':
      ensure => present,
      require => Class['ppa'];
    ['php5-mysql', 'php5-curl', 'php5-fpm', 'php5-gd', 'php5-memcache', 'php-apc']:
      ensure => present,
      require => Package['php5-cli'];
  }

  service {
    'php5-fpm':
      enable => true,
      ensure => running,
      hasstatus => false,
      pattern => 'php-fpm',
      require => Package['php5-fpm']
  }

  file {
    '/etc/init.d/php5-fpm':
      source => 'puppet:///modules/php/php5-fpm.init',
      require => Package['php5-fpm'],
      notify => Service['php5-fpm'];
    '/etc/php5/conf.d/apc.ini':
      source => 'puppet:///modules/php/apc.ini',
      require => Package['php-apc'],
      notify => Service['php5-fpm'];
    '/etc/php5/fpm/php.ini':
      source => 'puppet:///modules/php/php-fpm.ini',
      require => Package['php5-fpm'],
      notify => Service['php5-fpm'];
    '/etc/php5/fpm/pool.d/www.conf':
      source => 'puppet:///modules/php/www.conf',
      require => Package['php5-fpm'],
      notify => Service['php5-fpm'];
    '/var/run/php5-fpm':
      ensure => directory;
  }
}

# TODO: mkdir /var/tmp/nginx/cache
# TODO: install memcached
