# vim:ft=sh

if [ ! -e "$HOME/.no_customrc" ]; then
  if [ -z ${CUSTOMRC_INCLUDED+x} ]; then
    CUSTOMRC_INCLUDED=yes
    export CUSTOMRC_INCLUDED

    prepend_path ()
    {
      if [ -f "$1" ]; then
        CHECKED_PATH=$(dirname "$1")
      else
        CHECKED_PATH="$1"
      fi

      if [ -d "$CHECKED_PATH" ]; then
        case ":$PATH:" in
          *":$CHECKED_PATH:"*) :;; # already there
          *) PATH="$CHECKED_PATH:$PATH";;
        esac
      fi
    }

    append_path ()
    {
      if [ -f "$1" ]; then
        CHECKED_PATH=$(dirname "$1")
      else
        CHECKED_PATH="$1"
      fi

      if [ -d "$CHECKED_PATH" ]; then
        case ":$PATH:" in
          *":$CHECKED_PATH:"*) :;; # already there
          *) PATH="$PATH:$CHECKED_PATH";;
        esac
      fi
    }

    prepend_manpath ()
    {
      if [ -d "$1" ]; then
        case ":$PATH:" in
          *":$1:"*) :;; # already there
          *) MANPATH="$1:$MANPATH";;
        esac
      fi
    }

    source_profile_d ()
    {
      local PROFILE_D_DIRECTORY="$HOME"/.profile.d

      if [ -d "$PROFILE_D_DIRECTORY" ]; then
        local PROFILE_D_FILES=("$PROFILE_D_DIRECTORY"/*.sh)

        for i in "${PROFILE_D_FILES[@]}" ; do
          if [[ -r "$i" ]]; then
            if [ "${-#*i}" != "$-" ]; then
              # shellcheck disable=SC1090
              . "$i"
            else
              # shellcheck disable=SC1090
              . "$i" >/dev/null
            fi
          fi
        done
      fi
    }

    source_profile_d
  fi
fi
