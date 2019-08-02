# vim:ft=sh

if [ -z "$BASH_COMPLETIONS_INCLUDED" ]; then
  BASH_COMPLETIONS_INCLUDED=yes
  export BASH_COMPLETIONS_INCLUDED

  if [ -x "$(command -v foo)" ]; then
    if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
      # shellcheck disable=SC1090
      . "$(brew --prefix)/etc/bash_completion"
    fi
  fi
fi
