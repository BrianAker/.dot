# vim:ft=sh

if [ -z "$TRACEROUTE_INCLUDED" ]; then
  TRACEROUTE_INCLUDED=yes
  export TRACEROUTE_INCLUDED

  alias traceroute='traceroute -I'
fi
