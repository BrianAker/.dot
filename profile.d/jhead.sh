# vim:ft=sh

if [ -z "$JHEAD_INCLUDED" ]; then
  JHEAD_INCLUDED=yes
  export JHEAD_INCLUDED

  alias jhead='jhead -nofinfo'
fi
