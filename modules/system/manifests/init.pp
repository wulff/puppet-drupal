class system {
  file {
    '/etc/sysctl.conf':
      source => 'puppet:///modules/system/sysctl.conf',
  }
}
