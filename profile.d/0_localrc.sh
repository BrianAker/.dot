# vim:ft=sh

if [ -z "$LOCALRC_INCLUDED" ]; then
  LOCALRC_INCLUDED=yes
  export LOCALRC_INCLUDED
  prepend_local ()
  {
    local LOCAL_DIRECTORIES=(/usr/local/bin /usr/local/sbin)
    for x in "${LOCAL_DIRECTORIES[@]}"; do
      prepend_path "$x"
    done

    # For expanding MANPATH 
    prepend_manpath /usr/local/share/man
  }

  prepend_local
fi
