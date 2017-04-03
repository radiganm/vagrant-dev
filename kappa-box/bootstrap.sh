#!/bin/bash
## bootstrap.sh
## Mac Radigan

  apt-get update -q
  apt-get install -y -q make curl wget vim git tmux zsh netcat rsync build-essential rlwrap htop ack-grep gnuplot graphviz

  ## JDK
  apt-get install -y -q java-8-openjdk

  # Zookeeper
  apt-get install -y -q zookeeperd

  # Kafka
  adduser kafka -m
  adduser kafka sudo
  wget "http://mirror.cc.columbia.edu/pub/software/apache/kafka/0.8.2.1/kafka_2.11-0.8.2.1.tgz" -O /tmp/kafka.tgz
  (mkdir -p /opt && cd /opt && tar -xvzf ~/Downloads/kafka.tgz && ln -fs kafka kafka_2.11-0.8.2.1)
  echo "delete.topic.enable=true" >> /opt/kafka/config/server.properties

  # KafkaT
  sudo apt-get install -y -q ruby ruby-dev build-essential
  sudo gem install kafkat --source https://rubygems.org --no-ri --no-rdoc
  echo >~/.kakatcfg <<EOT
{
  "kafka_path": "~/kafka",
  "log_path": "/tmp/kafka-logs",
  "zk_path": "localhost:2181"
}
EOT

  mkdir -p /home/vagrant/.ssh
  cat ~/.ssh/id_rsa.pub >>/home/vagrant/.ssh/authorized_keys
  chmod 0700 /home/vagrant/.ssh
  chmod 0600 /home/vagrant/.ssh/authorized_keys
  chown -R ubuntu /home/vagrant/.ssh

## *EOF*
