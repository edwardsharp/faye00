#puppet essential... 
group { 'puppet': ensure => 'present' }

#global path def.
Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] } 

node default {
  include rvm
  include users

  exec { "update_package_list":
    user    => "root",
    command => "/usr/bin/apt-get update",
  }

  package {
    [ "ntp", "git-core" ] :
      ensure => present
  }

  rvm::install {
    #for user
    'faye' : ;
  }

}
  