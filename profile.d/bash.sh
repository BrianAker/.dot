if [ -z "$FIGNORERC_INCLUDED" ]; then
  FIGNORERC_INCLUDED=yes
  export FIGNORERC_INCLUDED

  FIGNORE=$FIGNORE:.reply:DS_Store:.hi:.pyc:.o
  export FIGNORE
fi
