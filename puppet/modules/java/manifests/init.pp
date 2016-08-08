class java {

	exec { "download-java":
		command => "wget --no-cookies --no-check-certificate --header \"Cookie: oraclelicense=accept-securebackup-cookie\" \"http://download.oracle.com/otn-pub/java/jdk/8u92-b14/jdk-8u92-linux-x64.tar.gz\" -O /tmp/jdk.tar.gz",
	}

	exec { "delete-java":
		command => "rm -rf /opt/java",
		before => Exec["install-java"],
	}

	exec { "install-java":
		command => "mkdir /opt/java && tar -xzvf /tmp/jdk.tar.gz -C /opt/java/ && ln -s /opt/java/jdk1.8.0_92/ /opt/java/default && rm -f /tmp/jdk.tar.gz",
		require => Exec["download-java"],
	}

	file { "/etc/profile.d/java.sh":
		content => "export JAVA_HOME=/opt/java/default
					export PATH=\$PATH:\$JAVA_HOME/bin",
	}
}