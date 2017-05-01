#!/bin/bash

  apt-get update -q
  apt-get install gcc make curl vim exuberant-ctags git tmux zsh ruby golang golang-doc netcat rsync build-essential rlwrap htop ack-grep gnuplot graphviz software-properties-common -y -q

  if hash gh-auth 2>/dev/null; then
    echo "-----> github-auth detected"
  else
    echo "-----> Installing Github key-based auth"
    gem install github-auth
  fi

  ## Install Bazel
  #add-apt-repository ppa:webupd8team/java
  #apt-get update -q
  #apt-get install oracle-java8-installer -y -q
  apt-get install -y -q java-8-openjdk

  echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list
  curl https://bazel.build/bazel-release.pub.gpg | apt-key add -

  apt-get update -q
  apt-get install -y -q bazel

 #cp /usr/local/bazel/bin/bazel-complete.bash /etc/bash_completion.d/

## *EOF*
