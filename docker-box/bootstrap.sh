#!/bin/bash

  apt-get update -q
  apt-get install -y -q docker-engine

  sudo usermod -aG docker $(whoami)

## *EOF*
