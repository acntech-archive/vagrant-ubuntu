class maven (
	$maven_home = "/opt/maven",
	$maven_archive = "apache-maven-3.3.9-bin.tar.gz",
	$maven_folder = "apache-maven-3.3.9",
	$tmp = "/tmp") {

	Exec {
		path => [ '/sbin', '/bin', '/usr/sbin', '/usr/bin' ]
	}

	exec { "download-maven" :
		command => "wget http://mirrors.ukfast.co.uk/sites/ftp.apache.org/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz -O ${tmp}/${maven_archive}",
	}

	exec { "extract-maven":
		command => "tar xvf ${maven_archive}",
		creates => "${maven_home}",
		cwd => "${tmp}",
		require => Exec["download-maven"],
	}

	exec { "move-maven":
		command => "mv ${maven_folder} ${maven_home}",
		creates => "${maven_home}",
		cwd => "${tmp}",
		require => Exec["extract-maven"],
	}

	file { "${maven_home}/maven":
		ensure => "directory",
		owner => "vagrant",
		mode => "0750",
		recurse => true,
		require => Exec["move-maven"],
	}

	file { "/etc/profile.d/maven.sh":
		content => "export MAVEN_HOME=${maven_home}
					export M2=\$MAVEN_HOME/bin
					export PATH=\$PATH:\$M2",	
	}
}