# vim:ft=sh

if [ -z "$CONFIGURERC_INCLUDED" ]; then
  CONFIGURERC_INCLUDED=yes
  export CONFIGURERC_INCLUDED

  CPPFLAGS="-I/usr/local/include"
  LDFLAGS="-L/usr/local/lib"
  export CPPFLAGS LDFLAGS
fi
