# vim:ft=sh

if [ -z "$JAVARC_INCLUDED" ]; then
  JAVARC_INCLUDED=yes
  export JAVARC_INCLUDED

  if [ -d "/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home" ]; then
    JAVA_HOME="/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home"
    export JAVA_HOME

    prepend_path "$JAVA_HOME/bin"
  fi
fi

