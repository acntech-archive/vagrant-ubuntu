class intellij {
	
	exec { "download-intellij":
		command => "wget https://download-cf.jetbrains.com/idea/ideaIC-2016.2.1.tar.gz -O /tmp/intellij.tar.gz",
	}

	exec { "delete-intellij":
		command => "rm -rf /opt/intellij",
		before => Exec["install-intellij"],
	}

	exec { "install-intellij":
		command => "mkdir /opt/intellij && tar -zxvf /tmp/intellij.tar.gz -C /opt/intellij && rm -f /tmp/intellij.*",
		require => Exec["download-intellij"],
	}
}