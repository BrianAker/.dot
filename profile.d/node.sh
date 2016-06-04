# vim:ft=sh
 
if [ -z "$NODEBREW_ROOT" ]; then
  export PATH=$HOME/.nodebrew/current/bin:$PATH
  export NODEBREW_ROOT=/usr/local/var/nodebrew
fi
