#!/bin/bash

  apt-get update -q
  apt-get install -y -q docker.io

  sudo usermod -aG docker $(whoami)

## *EOF*
