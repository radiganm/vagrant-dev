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

  # Install Haskell Stack
  apt-get install -y -q haskell-stack
  stack upgrade

## *EOF*
