# Just copy init.pp in your manifests directory. The module will download, unzip e move apache servicemix


  # Resource Default for exec
  Exec {
    path => ["/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/"] }

  package { 'tar':
      ensure => installed
  }

  package { 'unzip':
      ensure => installed
  }

  servicemix::setup { "servicemix":
      version => "5.0.1",
      family => "servicemix-5",
      installdir => "/opt/",
      tmpdir => "/tmp/"
  }
