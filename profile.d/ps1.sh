# vim:ft=sh

# Check for interactive bash(1) shells.
if [ -z "$PS1" ]; then
  return
fi

if [ -z "$PS1RC_INCLUDED" ]; then
  PS1RC_INCLUDED=yes
  PS1="\u@\h: \w \\$\[$(tput sgr0)\] "
  export PS1
fi
