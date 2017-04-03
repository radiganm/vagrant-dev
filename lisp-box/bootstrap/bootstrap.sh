#!/bin/bash
## bootstrap.sh
## Mac Radigan, Eric Paniagua

  apt-get update -q
  apt-get install -y \
    astyle \
    gcc \
    gfortran \
    cmake \
    fftwdev \
    libopenblas-base \
    libopenblas-dev \
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
    libgl1-mesa-glx \
    libgl1-mesa \
    libgl1-mesa-dev \
    libglu1-mesa \
    libglu1-mesa-dev \
    mesa-common-dev \
    mesa-utils \
    mesa-utils-extra \
    freeglut3 \
    freeglut3-dev \
    ack-grep \
    software-properties-common \
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

  # Install Bazel
  apt-get install -y -q java-8-openjdk
  echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list
  curl https://bazel.build/bazel-release.pub.gpg | apt-key add -
  apt-get update -q
  apt-get install -y -q bazel
  cp -f /usr/local/bazel/bin/bazel-complete.bash /etc/bash_completion.d/

  # Install SBCL
  apt-get install -y -q sbcl

  # Install CLisp
  apt-get install -y -q clisp

  # Install ECL
  apt-get install -y -q libgmp3-dev
  apt-get install -y -q libatomic-ops-dev
  (  mkdir -p /opt && \
     cd /opt && \
     git clone https://github.com/radiganm/ecl.git ./ecl && \
     cd ./ecl && \
     ./configure && \
     echo "compiling ECL ..." && \
     make 1>/dev/null 2>/dev/null && \
     sudo make install \
  )

  # Install Bazel Lisp
  (  mkdir -p /opt && \
     cd /opt && \
     git clone https://github.com/radiganm/bazelisp.git ./bazelisp && \
     echo "compiling BazeLisp ..." && \
     cd ./bazelisp 1>/dev/null 2>/dev/null && \
     make \
  )

  # Install Tecla Library
  (  mkdir -p /opt && \
     cd /opt && \
     git clone https://github.com/radiganm/tecla.git ./tecla && \
     cd ./tecla && \
     ./configure && \
     echo "compiling Tecla Library ..." && \
     make 1>/dev/null 2>/dev/null && \
     sudo make install \
  )

  # Install NanoMsg Library
  (  mkdir -p /opt && \
     cd /opt && \
     git clone https://github.com/radiganm/nanomsg.git ./nanomsg && \
     cd ./nanomsg && \
     cmake . && \
     echo "compiling NanoMsg Library ..." && \
     make 1>/dev/null 2>/dev/null && \
     sudo make install \
  )

  # Install Disp Module
  (  mkdir -p /opt && \
     cd /opt && \
     git clone https://github.com/radiganm/dispmodule.git ./dispmodule && \
     cd ./dispmodule && \
     echo "compiling Disp Module ..." && \
     make 1>/dev/null 2>/dev/null \
  ) || true

## *EOF*
