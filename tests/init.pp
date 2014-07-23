Exec {
  path => ["/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/"] }

notify {"We are running on ${operatingsystem}": }

servicemix::setup { "servicemix":
  version => "5.0.1",
  family => "servicemix-5",
  smixname => "apache-servicemix",
  path => "/opt/",
  tmp => "/tmp/"
  }

notify {"Servicemix installed":}
