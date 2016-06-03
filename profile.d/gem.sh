# vim:ft=sh
 
if [ -z "$GEMRC_INCLUDED" ]; then
  GEMRC_INCLUDED=yes
  export GEMRC_INCLUDED

  if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
  fi

fi

