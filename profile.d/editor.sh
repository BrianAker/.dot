# vim:ft=sh

if [ -z "$EDITORRC_INCLUDED" ]; then
  EDITORRC_INCLUDED=yes
  export EDITORRC_INCLUDED

  alias vi=vim 
  if [ -x '/usr/local/bin/vim' ]; then
    alias vim='/usr/local/bin/vim'
  fi

  export VISUAL="mvim -f"
  export EDITOR="vim"
  export GIT_EDITOR="$VISUAL"
fi
