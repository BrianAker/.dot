#!/bin/bash
# vim:ft=sh

if [[ $PS1 ]]; then
  if [[ -z $EDITOR ]]; then
    unset VISUAL
    unset EDITOR

    if [[ -x /Applications/MacVim.app/Contents/bin/vim ]]; then
      EDITOR='/Applications/MacVim.app/Contents/bin/vim'
      alias vim='/Applications/MacVim.app/Contents/bin/vim'
      alias vi='/Applications/MacVim.app/Contents/bin/vim'
      prepend_path "$EDITOR"
    elif [[ -x /usr/local/bin/vim ]]; then
      alias vim='/usr/local/bin/vim'
      alias vi='/usr/local/bin/vim'
      EDITOR='/usr/local/bin/vim'
    elif [[ -x /usr/bin/vim ]]; then
      alias vim='/usr/bin/vim'
      alias vi='/usr/bin/vim'
      EDITOR='/usr/bin/vim'
    else
      EDITOR='vi'
    fi

    if [[ -n "$DISPLAY" || -n "$TERM_PROGRAM" ]]; then
      if [[ -x /Applications/MacVim.app/Contents/bin/mvim ]]; then
        VISUAL='/Applications/MacVim.app/Contents/bin/mvim'
        if [[ -z $EDITOR ]]; then
          alias vi='"$VISUAL"'
          EDITOR="$VISUAL"
        fi
      elif [[ -x /usr/local/bin/mvim ]]; then
        VISUAL=/usr/local/bin/mvim
        if [ -z "$EDITOR" ]; then
          alias vi='"$VISUAL"'
          EDITOR="$VISUAL"
        fi
      fi
    fi

    if [ -z "$VISUAL" ]; then
      VISUAL="$EDITOR"
    fi

    export VISUAL
    export EDITOR
    export GIT_EDITOR="$VISUAL"


    # sudo should never use anything but the default editor
    if [[ -x /usr/bin/vim ]]; then
      if [[ ! -d /usr/bin/vim ]]; then
        SUDO_EDITOR='/usr/bin/vim'
      fi
    fi

    if [[ -z $SUDO_EDITOR ]]; then
      SUDO_EDITOR='/usr/bin/vi'
    fi
    export SUDO_EDITOR
  fi
fi
