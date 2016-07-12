# vim:ft=sh

if [[ ! -z "$JAVA_HOME" ]]; then
  export JAVA_HOME

  if [[ -d "/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home" ]]; then
    JAVA_HOME="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home"

    prepend_path "$JAVA_HOME/bin"
  else
    JAVA_HOME=""
  fi
  echo "Called"
fi
