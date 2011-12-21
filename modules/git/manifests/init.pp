class git {
  package {
    'git-core':
      ensure => present;
  }
  file {
    "/home/$username/.gitconfig":
      content => template('git/gitconfig.erb'),
      owner => $username,
      group => $username,
#      require => User[$username]
  }
}
