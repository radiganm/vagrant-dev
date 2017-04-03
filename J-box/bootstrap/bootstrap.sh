#!/bin/bash
## bootstrap.sh
## Mac Radigan

  apt-get update -q
  apt-get install -y \
    make \
    curl \
    wget \
    dtrx \
    xclip \
    rxvt-unicode \
    xterm \
    vim \
    vim-gnome \
    exuberant-ctags \
    cscope \
    global \
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
    gnuplot-x11 \
    gnuplot-qt \
    gnuplot-nox \
    graphviz

  if hash gh-auth 2>/dev/null; then
    echo "-----> github-auth detected"
  else
    echo "-----> Installing Github key-based auth"
    gem install github-auth
  fi

  chsh -s /bin/zsh ubuntu

  # Install J Software
  (  mkdir -p /opt && \
     cd /opt && \
     git clone https://github.com/radiganm/jsource.git ./jsource && \
     cd ./jsource \
  )

  # Install Tecla Library
  (  mkdir -p /opt && \
     cd /opt && \
     git clone https://github.com/radiganm/tecla.git ./tecla && \
     cd ./tecla && \
     ./configure && \
     make && \
     sudo make install \
  )

## *EOF*
