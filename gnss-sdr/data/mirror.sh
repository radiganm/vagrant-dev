#!/bin/bash
## mirror.sh
## Mac Radigan

  ## aptly
  export APTLY__DIST=trusty
  export APTLY__URL=http://mirrors.mit.edu/ubuntu/
  export APTLY__MIRROR=aptmirror
  function aptly-create { 
    pkg="$1"
    dist=$APTLY__DIST
    sudo aptly mirror create -architectures=amd64 -filter=$pkg -filter-with-deps $APTLY__MIRROR $APTLY__URL $dist
  }
  function aptly-edit { 
    pkg="$1"
    sudo aptly mirror edit -architectures=amd64 -filter=$pkg $APTLY__MIRROR
  }
  function aptly-clean { 
    sudo aptly mirror drop $APTLY__MIRROR
  }
  function aptly-export { 
    sudo aptly mirror update $APTLY__MIRROR || true
    sudo aptly snapshot create $APTLY__MIRROR from mirror $APTLY__MIRROR
    sudo aptly publish snapshot $APTLY__MIRROR
  }

  aptly-clean

  aptly-create gnss-sdr                     
  aptly-edit   build-essential              
  aptly-edit   cmake                        
  aptly-edit   git                          
  aptly-edit   libboost-dev                 
  aptly-edit   libboost-date-time-dev       
  aptly-edit   libboost-system-dev          
  aptly-edit   libboost-filesystem-dev      
  aptly-edit   libboost-thread-dev          
  aptly-edit   libboost-chrono-dev          
  aptly-edit   libboost-serialization-dev   
  aptly-edit   libboost-program-options-dev 
  aptly-edit   libboost-test-dev            
  aptly-edit   liblog4cpp5-dev              
  aptly-edit   libuhd-dev                   
  aptly-edit   gnuradio-dev                 
  aptly-edit   gr-osmosdr                   
  aptly-edit   libblas-dev                  
  aptly-edit   liblapack-dev                
  aptly-edit   libarmadillo-dev             
  aptly-edit   libgflags-dev                
  aptly-edit   libgoogle-glog-dev           
  aptly-edit   libgnutls-openssl-dev        
  aptly-edit   libgtest-dev                 
  aptly-edit   python-mako                  
  aptly-edit   python-six

  aptly-export

## *EOF*
