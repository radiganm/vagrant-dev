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
    htop

  if hash gh-auth 2>/dev/null; then
    echo "-----> github-auth detected"
  else
    echo "-----> Installing Github key-based auth"
    gem install github-auth
  fi

  chsh -s /bin/zsh ubuntu


## *EOF*
