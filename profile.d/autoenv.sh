# vim:ft=sh

if [ -z "$AUTOENVRC_INCLUDED" ]; then
  AUTOENVRC_INCLUDED=yes
  export AUTOENVRC_INCLUDED

  if [ -x /usr/local/opt/autoenv/activate ]; then
    # shellcheck disable=SC1091
    source /usr/local/opt/autoenv/activate.sh
  fi
fi
