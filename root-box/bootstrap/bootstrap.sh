#!/bin/bash
## bootstrap.sh
## Mac Radigan

  apt-get update -q
  apt-get install -y \
    software-properties-common \
    gcc \
    gfortran \
    root-system \
    python3-dev \
    torque-server \
    torque-client \
    torque-mom \
    torque-pam \
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

  chsh -s /bin/zsh ubuntu

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
