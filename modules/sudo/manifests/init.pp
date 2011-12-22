class sudo {
  file {
    '/etc/sudoers':
      source => 'puppet:///modules/sudo/sudoers',
      owner => root,
      group => root,
      mode => 440
  }
}
