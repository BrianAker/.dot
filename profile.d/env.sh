# vim:ft=sh

if [ -z "$ENVRC_INCLUDED" ]; then
  ENVRC_INCLUDED=yes
  export ENVRC_INCLUDED

  LC_CTYPE="en_US.UTF-8"
  LC_ALL="en_US.UTF-8"
  LANG="en_US.UTF-8"
  export LC_CTYPE LC_ALL LANG
fi
