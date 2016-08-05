#
# Build AcnTech Vagrant box
#
include maven

# Install latest jdk
class { "java":
  distribution => "jdk",
  version      => "latest",
}