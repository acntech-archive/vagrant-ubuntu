class maven (
	$maven_version = "3.3.9", # Change this value to upgrade maven.
    $maven_home = "/opt/maven",
    $maven_default = "/opt/maven/default",
    $maven_archive = "apache-maven-${maven_version}-bin.tar.gz",
    $maven_folder = "apache-maven-${maven_version}",
    $tmp = "/tmp"
    ) {

    exec { "download-maven" :
        command => "wget https://www.apache.org/dist/maven/maven-3/${maven_version}/binaries/${maven_archive} -O ${tmp}/${maven_archive}",
    }

	file { "${maven_home}" :
        ensure => "directory",
        before => Exec["extract-maven"],
    }

    exec { "extract-maven":
        command => "tar -xzvf ${tmp}/${maven_archive} -C ${maven_home} && rm ${tmp}/${maven_archive}",
        require => Exec["download-maven"],
    }

	file { "maven-symlink":
		path => "${maven_default}",
		ensure => "link",
		target => "${maven_home}/${maven_folder}",
		require => Exec["extract-maven"],
	}

    file { "/etc/profile.d/maven.sh":
        content => "export MAVEN_HOME=${maven_default}\nexport M2_HOME=\${MAVEN_HOME}\nexport PATH=\${PATH}:\$MAVEN_HOME/bin\n",
        require => Exec["extract-maven"],
    }
}
