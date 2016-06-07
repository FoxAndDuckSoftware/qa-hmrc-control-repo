# == Class: profile::jenkins::slave
#
class profile::jenkins::slave ($masterurl, $user, $pass) {
  class { '::jenkins::slave':
    masterurl => $masterurl,
    ui_user   => $user,
    ui_pass   => $pass
  }
}
