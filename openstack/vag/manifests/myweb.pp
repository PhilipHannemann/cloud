package {
    "apache2":
          ensure => installed
    }
    exec { 
    	"apt-update":
       command => "/usr/bin/apt-get update"
    }


file {
    '/var/www/html/index.html':
      content => "<html><body>I love <b>CS218!</b></body></html>",
      require => Package["apache2"],
}


Exec["apt-update"] -> Package <| |>