class cron {
  service {
    'cron':
      ensure => running,
      enable => true
  }

  cron {
    'xn--lrdrupal-j0a.dk':
      command => '/usr/local/bin/drush -r /var/www/drupal7 -l http://xn--lrdrupal-j0a.dk cron',
      user => 'root',
      minute => '*/42',
  }
}
