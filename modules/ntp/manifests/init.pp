class ntp {
  package {
    'ntp':
      ensure => latest;
  }
}

