# Class: servicemix
#
# The servicemix module allows Puppet to install Apache Servicemix
#
# Provides: servicemix::setup resource definition
#
# Parameters: version, family, path, tmp
# Validation: version and family cannot be undef

# Example:
# servicemix::setup { "servicemix":
#  version => "5.0.1",
#  family => "servicemix-5",
#  path => "/opt/",
#  tmp => "/tmp/"
#  }
#
# Refer to the module README for documentation
#

class servicemix {
}
