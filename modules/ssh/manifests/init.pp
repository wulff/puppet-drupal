class ssh {
  file {
    '/etc/ssh/sshd_config':
      content => template('ssh/sshd_config.erb');
  }
  ssh_authorized_key {
    $username:
      user => $username,
      ensure => present,
      type => 'ssh-rsa',
      key => $authorized_key,
      require => User[$username];
  }
}
