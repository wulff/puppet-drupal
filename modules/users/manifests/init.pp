class users {
  group {
    $username:
      gid => 1000,
      ensure => present
  }

  user {
    $username:
       uid => 1000,
       gid => 1000,
       groups => 'admin',
       comment => 'This user is managed by Puppet',
       ensure => present,
       managehome => true,
       require => Group[$username]
  }
}
