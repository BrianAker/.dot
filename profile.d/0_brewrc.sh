# vim:ft=sh
if [ -z "$HOMEBREW_EDITOR" ]; then
  HOMEBREW_EDITOR=vim
  export HOMEBREW_EDITOR

  check_brew ()
  {
    if [ -x /usr/local/bin/brew ]; then

      append_local

      local BREW_DIRECTORIES=(/usr/local/opt/bison/bin /usr/local/opt/flex/bin /usr/local/opt/gperf/bin /usr/local/opt/gettext/bin)
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
