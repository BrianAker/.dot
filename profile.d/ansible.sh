if [ -z "$ANSIBLERC_INCLUDED" ]; then
  ANSIBLERC_INCLUDED=yes
  export ANSIBLERC_INCLUDED

  if [ -z "$ANSIBLE_INVENTORY" ]; then
    if [[ -d ${HOME}/.inventory ]]; then
      ANSIBLE_INVENTORY=${HOME}/.inventory/
      export ANSIBLE_INVENTORY
    fi
  fi
fi
