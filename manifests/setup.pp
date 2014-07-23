  define servicemix::setup (
  $version = "5.0.1",
  $family = "servicemix-5",
  $smixname = "apache-servicemix",
  $path = "/opt/",
  $tmp = "/tmp/",
  ) {
  
  $source = "http://archive.apache.org/dist/servicemix/${family}/${version}/${smixname}-${version}.zip"

  package { 'unzip':
      ensure => installed,
      alias => unzip   
  }

  exec { 'retrieve_servicemix': 
          command => "wget -q ${source} -P ${tmp}",
          unless => "ls ${path}${smixname}-${version}/",
          timeout => 1000 }

  exec { 'unzip_servicemix': 
          command => "unzip ${tmp}${smixname}-${version}.zip -d ${tmp}",
          require => [ Exec['retrieve_servicemix'], 
                       Package[unzip] ],
          unless => "ls ${path}${smixname}-${version}/" }

  exec { 'mv_servicemix': 
          command => "mv ${tmp}${smixname}-${version}/ ${path}",
          require => Exec['unzip_servicemix'],
          unless => "ls ${path}${smixname}-${version}/" }
          
  exec { 'clean_servicemix': 
          command => "rm -rf ${tmp}${smixname}-${version}.zip",
          require => Exec['mv_servicemix'],
          logoutput => "false" }
}