#!/bin/bash
## bootstrap.sh
## Mac Radigan, Eric Paniagua

  apt-get update -q
  apt-get install gcc make curl vim exuberant-ctags git tmux zsh ruby netcat rsync build-essential rlwrap htop ack-grep gnuplot graphviz software-properties-common -y -q

  if hash gh-auth 2>/dev/null; then
    echo "-----> github-auth detected"
  else
    echo "-----> Installing Github key-based auth"
    gem install github-auth
  fi

  # Install SBCL
  apt-get install -y -q sbcl

  # Install ECL
  (  mkdir -p /opt && \
     cd /opt && \
     git clone https://github.com/radiganm/ecl.git ./ecl && \
     cd ./ecl && \
     ./configure && \
     make && \
     make install \
  )

  # Install Tecla Library
  (  mkdir -p /opt && \
     cd /opt && \
     git clone https://github.com/radiganm/tecla.git ./tecla && \
     cd ./tecla && \
     ./configure && \
     make && \
     make install \
  )

## *EOF*
