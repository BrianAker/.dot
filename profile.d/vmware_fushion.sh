# vim:ft=sh

if [ -z "$VMWARE_FUSHIONRC_INCLUDED" ]; then
  VMWARE_FUSHIONRC_INCLUDED=yes
  export VMWARE_FUSHIONRC_INCLUDED

  VMWARE_FUSHION_PATH="/Applications/VMware Fusion.app/Contents/Library"

  prepend_path "$VMWARE_FUSHION_PATH"
fi

