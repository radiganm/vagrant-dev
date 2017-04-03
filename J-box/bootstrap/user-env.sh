#!/bin/bash
## user-env.sh
## Mac Radigan

  curl -s https://raw.githubusercontent.com/radiganm/environment/master/bootstrap/home.sh | sh
  echo "export PROMPT=\"%(?.%F{green}-.%F{magenta}%?)%F{yellow}%(!.#. )%F{blue}>< %F{white}\"" > ~/.ubuntu-yakkety.alias

## *EOF*
