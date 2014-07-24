# Just copy init.pp in your manifests directory. The module will download, unzip e move apache servicemix

servicemix::setup { "servicemix":
  version => "5.0.1",
  family => "servicemix-5",
  installdir => "/opt/",
  tmpdir => "/tmp/"
  }
