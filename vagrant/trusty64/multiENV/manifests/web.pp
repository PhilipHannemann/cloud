package {
    "apache2":
          ensure => installed
    }
    exec { 
    	"apt-update":
       command => "/usr/bin/apt-get update"
    }

Exec["apt-update"] -> Package <| |>