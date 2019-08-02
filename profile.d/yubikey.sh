# vim:ft=sh

if [ -z "$YUBIKEYRC_INCLUDED" ]; then
  YUBIKEYRC_INCLUDED=yes
  export YUBIKEYRC_INCLUDED

  check_yubikey_manager ()
  {
   YUBIKEY_MANAGER_PATH=/Applications/YubiKey\ Manager.app/Contents/MacOS/
    if [ -x "$YUBIKEY_MANAGER_PATH" ]; then
      prepend_path "$YUBIKEY_MANAGER_PATH"
    fi
  }

  check_yubikey_manager
fi

