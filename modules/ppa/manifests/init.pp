class ppa {
  package {
    'python-software-properties':
      ensure => present,
  }
  exec {
    'ppa-add-repo-php5':
      command => 'add-apt-repository ppa:nginx/php5',
      creates => '/etc/apt/sources.list.d/nginx-php5-lucid.list',
      require => Package['python-software-properties'];
    'ppa-add-repo-stable':
      command => 'add-apt-repository ppa:nginx/stable',
      creates => '/etc/apt/sources.list.d/nginx-stable-lucid.list',
      require => Package['python-software-properties'];
    'ppa-update':
      command => 'aptitude -y update && touch /root/.ppa-update',
      creates => '/root/.ppa-update',
      require => Exec['ppa-add-repo-php5', 'ppa-add-repo-stable'];
  }
}
