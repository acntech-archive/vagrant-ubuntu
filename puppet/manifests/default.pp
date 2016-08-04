#
#
# Build AcnTech Vagrant box
#

# Install latest jdk
class { "java":
  distribution => "jdk",
  version      => "latest",
}
