class servicemix {
  include servicemix::params
  
  $version = $servicemix::params::version
  $family = $servicemix::params::family
  $source = $servicemix::params::source
  $path = $servicemix::params::path
  $tmp = $servicemix::params::tmp
  $smixname = $servicemix::params::smixname

  package { 'unzip':
      ensure => installed,
      alias => unzip   
  }

  exec { 'retrieve_servicemix': 
          command => "wget -q ${source} -P ${tmp}",
          unless => "ls ${path}${smixname}-${version}/" }

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
