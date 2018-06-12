# vim:ft=sh
 
if [ -z "$GEMRC_INCLUDED" ]; then
  GEMRC_INCLUDED=yes
  export GEMRC_INCLUDED

  if command -v ruby >/dev/null && command -v gem >/dev/null; then
    prepend_path "$(ruby -rubygems -e 'puts Gem.user_dir')/bin"
  fi

fi

