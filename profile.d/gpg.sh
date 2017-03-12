# vim:ft=sh

if [ -z "$GPG_TTY" ]; then
  GPG_TTY=$(tty)
  export GPG_TTY
fi

check_MacGPG2 ()
{
  if [ -d /usr/local/MacGPG2/bin ]; then
    local MacGPG2_DIRECTORIES=(/usr/local/MacGPG2/bin)
    for x in "${MacGPG2_DIRECTORIES[@]}"; do
      prepend_path "$x"
    done

  fi

  # Enable GPG keys for SSH Auth
  if [ -z "$GPG_AGENT_INFO" ]; then
    if [ -f "${HOME}/.gpg-agent-info" ]; then
      . "${HOME}/.gpg-agent-info"
      export GPG_AGENT_INFO
      export SSH_AUTH_SOCK
      export SSH_AGENT_PID
    fi
  fi
} 

check_MacGPG2
