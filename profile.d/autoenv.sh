# vim:ft=sh

if [ -z "$AUTOENVRC_INCLUDED" ]; then
  AUTOENV_ACTIVATE="/usr/local/opt/autoenv/activate.sh"
  if [ -x "$AUTOENV_ACTIVATE" ]; then
    # shellcheck disable=SC1091
    source "$AUTOENV_ACTIVATE"

    AUTOENVRC_INCLUDED=yes
    export AUTOENVRC_INCLUDED
  fi
fi
