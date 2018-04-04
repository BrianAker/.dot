# vim:ft=sh
brew () {
  ( brew_internal "$@" )
  b=$!

  wait $b
}

brew_internal () {
  deactivate
  env -i HOME="$HOME" PATH="$PATH:/usr/local/bin:/usr/local/sbin" /usr/local/bin/brew "$@"
}

if [ -z "$HOMEBREWRC_INCLUDED" ]; then
  HOMEBREWRC_INCLUDED=yes
  export HOMEBREWRC_INCLUDED

  HOMEBREW_EDITOR=vim
  export HOMEBREW_EDITOR

  check_brew ()
  {
    BREW_PATH=/usr/local/bin/brew
    if [ -x "$BREW_PATH" ]; then
      prepend_path "$BREW_PATH"

      local BREW_DIRECTORIES=(/usr/local/sbin /usr/local/opt/bison/bin /usr/local/opt/flex/bin /usr/local/opt/gperf/bin /usr/local/opt/gettext/bin)
      for x in "${BREW_DIRECTORIES[@]}"; do
        prepend_path "$x"
      done
    fi

    if [ -f /usr/local/Library/Contributions/brew_bash_completion.sh ]; then
      # shellcheck disable=SC1091
      . /usr/local/Library/Contributions/brew_bash_completion.sh
    fi
  }

  check_brew
fi
