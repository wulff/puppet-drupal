class drush {
  exec {
    'download-drush':
      command => 'wget -P /root http://ftp.drupal.org/files/projects/drush-7.x-4.5.tar.gz',
      creates => '/root/drush-7.x-4.5.tar.gz';
    'install-drush':
      cwd => '/opt',
      command => 'tar xzf /root/drush-7.x-4.5.tar.gz && chown -R root.root /opt/drush',
      creates => '/opt/drush/drush',
      require => Exec['download-drush'];
    'download-drush-make':
      command => 'wget -P /root http://ftp.drupal.org/files/projects/drush_make-6.x-2.3.tar.gz',
      creates => '/root/drush_make-6.x-2.3.tar.gz';
    'install-drush-make':
      cwd => '/usr/share/drush/commands',
      command => 'tar xzf /root/drush_make-6.x-2.3.tar.gz && chown -R root.root /usr/share/drush/commands/drush_make',
      creates => '/usr/share/drush/commands/drush_make',
      require => [Exec['download-drush-make'], File['/usr/share/drush/commands']];
    'install-drush-console-table':
      command => '/opt/drush/drush',
      creates => '/opt/drush/includes/table.inc',
      require => [Exec['install-drush'], Package['php5-cli']];
  }

  file {
    '/usr/local/bin/drush':
      ensure => '/opt/drush/drush',
      require => Exec['install-drush'];
    ['/usr/share/drush', '/usr/share/drush/commands']:
      ensure => directory;
  }
}
