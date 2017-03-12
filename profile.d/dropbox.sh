# vim:ft=sh

if [ -f "$HOME/.dropbox/info.json" ]; then
  if [ -z "$DROPBOXRC_INCLUDED" ]; then
    DROPBOXRC_INCLUDED=yes
    export DROPBOXRC_INCLUDED

    DROPBOX_PERSONAL=$(python -c "import json;f=open('$HOME/.dropbox/info.json', 'r').read();data=json.loads(f);print data.get('personal', {}).get('path', '')")
    export DROPBOX_PERSONAL
  fi
fi
