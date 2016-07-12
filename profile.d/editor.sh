# vim:ft=sh

if [[ $PS1 ]]; then
  if [[ -z "$EDITOR" ]]; then
    VISUAL=
    EDITOR=

    if [[ -x /usr/local/bin/vim ]]; then
      alias vim='/usr/local/bin/vim'
      alias vi='/usr/local/bin/vim'
      EDITOR=/usr/local/bin/vim
    elif [[ -x /usr/bin/vim ]]; then
      alias vim='/usr/bin/vim'
      alias vi='/usr/bin/vim'
      EDITOR=/usr/bin/vim
    else
      EDITOR=vi
    fi

    if [[ -n "$DISPLAY" || -n "$TERM_PROGRAM" ]]; then
      if [ -x /usr/local/bin/mvim ]; then
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
  fi
fi
