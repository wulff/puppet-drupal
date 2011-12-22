class memcache {
  package {
    'memcached':
      ensure => present,
  }

  service {
    'memcached':
      enable => true,
      ensure => running,
      require => Package['memcached']
  }
}
