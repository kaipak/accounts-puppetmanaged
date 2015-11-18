define accounts_puppetmanaged::account(
  $passwd,
  $sshkey,
  $shell = '/bin/bash',
){

  user { $title:
    ensure     => present,
    managehome => true,
    password   => $passwd,
  }

  file { "/home/${title}/.ssh":
    ensure => directory,
    mode   => 0700,
  }

  file { "/home/${title}/.ssh/id_rsa":
    ensure  => file,
    mode    => 0600,
    content => $sshkey
    owner   => $title,
    group   => $title,
  }
}
