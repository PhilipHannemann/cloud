file {
'/etc/motd':
content => "Hello CS218! Welcome to puppet.\n"
}

package {
	"apache2":
                ensure => installed
}
        
exec { 
	"apt-update":
		command => "/usr/bin/apt-get update"
}

Exec["apt-update"] -> Package <| |>