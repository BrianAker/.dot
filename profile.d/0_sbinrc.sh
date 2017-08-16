# vim:ft=sh

if [ -z "$SBINRC_INCLUDED" ]; then
  SBINRC_INCLUDED=yes
  export SBINRC_INCLUDED

  append_path /usr/sbin
  append_path /sbin
fi
