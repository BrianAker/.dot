# vim:ft=sh

if [ -z "$REBOOT_INCLUDED" ]; then
  REBOOT_INCLUDED=yes
  export REBOOT_INCLUDED

  alias reboot='sudo fdesetup authrestart'
fi
