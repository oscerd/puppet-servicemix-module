# Just copy init.pp in your manifests directory. The module will download, unzip e move apache servicemix

Exec {
  path => ["/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/"] }

servicemix::setup { "servicemix":
  version => "5.0.1",
  family => "servicemix-5",
  path => "/opt/",
  tmp => "/tmp/"
  }
