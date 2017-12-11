if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  if ! cmp -s "$HOME"/.hushlogin /etc/motd ; then
    tee "$HOME"/.hushlogin < /etc/motd
  fi
fi
