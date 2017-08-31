#!/bin/bash
## bootstrap.sh
## Mac Radigan, Eric Paniagua

  apt-get update -q
  apt-get install -y -q \
    gcc \
    make \
    curl \
    vim \
    exuberant-\
    ctags \
    git \
    tmux \
    zsh \
    ruby \
    netcat \
    rsync \
    build-essential \
    rlwrap \
    htop \
    ack-grep \
    gnuplot \
    graphviz \
    software-properties-common

  if hash gh-auth 2>/dev/null; then
    echo "-----> github-auth detected"
  else
    echo "-----> Installing Github key-based auth"
    gem install github-auth
  fi

 #chsh -s /bin/zsh ubuntu

  ## Install Haskell Stack
 #apt-get install -y haskell-stack
 #stack upgrade --git
 #stack upgrade
  curl -sSL https://get.haskellstack.org/ | sh
 #stack setup
 #stack upgrade
  stack install music-suite

## *EOF*
