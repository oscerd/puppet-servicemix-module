  define servicemix::setup (
  $version = undef,
  $family = undef,
  $installdir = undef,
  $tmpdir = undef,
  ) {
  
  # Validate parameters
  if ($version == undef) {
    fail('version parameter must be set')
  }

  if ($family == undef) {
    fail('family parameter must be set')
  }
  
  if ($installdir == undef){
    notify{'Install folder not specified, setting default install folder /opt/':}
    $defined_installdir ='/opt/'
  } else {
    $defined_installdir = $installdir
  }

  if ($tmpdir == undef){
    notify{'Temp folder not specified, setting default install folder /tmp/':}
    $defined_tmpdir ='/tmp/'
  } else {
    $defined_tmpdir = $tmpdir
  }
  
  $smixname = "apache-servicemix"
  $source = "http://archive.apache.org/dist/servicemix/${family}/${version}/${smixname}-${version}.zip"

  package { 'unzip':
      ensure => installed,
      alias => unzip   
  }

  exec { 'retrieve_servicemix': 
          command => "wget -q ${source} -P ${defined_tmpdir}",
          unless => "ls ${defined_installdir}${smixname}-${version}/",
          timeout => 1000 }

  exec { 'unzip_servicemix': 
          command => "unzip ${defined_tmpdir}${smixname}-${version}.zip -d ${defined_tmpdir}",
          require => [ Exec['retrieve_servicemix'], 
                       Package[unzip] ],
          unless => "ls ${defined_installdir}${smixname}-${version}/" }

  exec { 'mv_servicemix': 
          command => "mv ${defined_tmpdir}${smixname}-${version}/ ${defined_installdir}",
          require => Exec['unzip_servicemix'],
          unless => "ls ${defined_installdir}${smixname}-${version}/" }
          
  exec { 'clean_servicemix': 
          command => "rm -rf ${defined_tmpdir}${smixname}-${version}.zip",
          require => Exec['mv_servicemix'],
          logoutput => "false" }
}