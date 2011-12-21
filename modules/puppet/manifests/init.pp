class puppet {
  package {
    'puppet':
      ensure => present
  }
  service {
    'puppet':
      pattern => '/usr/sbin/puppetd',
      ensure => stopped,
      enable => false
    }
  file {
    '/usr/local/bin/puppet-run.sh':
      content => template('puppet/puppet.sh.erb'),
      mode => 755
  }
}
