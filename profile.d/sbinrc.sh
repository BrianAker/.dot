# vim:ft=sh

if [ -z "$SBINRC_INCLUDED" ]; then
  SBINRC_INCLUDED=yes
  export SBINRC_INCLUDED

  prepend_path /usr/sbin
  prepend_path /sbin
fi
