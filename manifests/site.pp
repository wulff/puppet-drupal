Exec { path => "/usr/sbin/:/sbin:/usr/bin:/bin" }
File { owner => 'root', group => 'root' }

node 'default' {
  $authorized_key = 'YOUR SSH PUBLIC KEY'
  $mysql_password = 'YOUR DESIRED MYSQL ROOT PASSWORD'
  $username = 'YOUR DESIRED USERNAME'
  $mail = 'YOUR E-MAIL ADDRESS'

  $github_user = 'YOUR GITHUB USERNAME'
  $github_token = 'YOUR GITHUB TOKEN'

  include puppet
  include users
  include ssh
  include cron
  include ppa
  include system
  include git
  include mysql
  include nginx
  include ntp
  include php
  include drush
  include mysqltuner
  include mtop
  include htop
  include munin
  include unzip
}
