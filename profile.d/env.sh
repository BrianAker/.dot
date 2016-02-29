# vim:ft=sh

if [ -z "$ENVRC_INCLUDED" ]; then
  ENVRC_INCLUDED=yes
  export ENVRC_INCLUDED

  LC_CTYPE=C 
  LANG=C
  export LC_CTYPE LANG
fi
