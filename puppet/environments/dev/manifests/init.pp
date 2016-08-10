#
# Build AcnTech Vagrant box
#

Exec {
	path => [ '/sbin', '/bin', '/usr/sbin', '/usr/bin' ]
}

include java
include maven
include intellij
include git
