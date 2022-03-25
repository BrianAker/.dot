# vim:ft=sh

pip_upgrade() {
  pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
}
 
if [ -z "$PYTHONRC_INCLUDED" ]; then
  PYTHONRC_INCLUDED=yes
  export PYTHONRC_INCLUDED

  VIRTUAL_ENV_DISABLE_PROMPT=yes
  export VIRTUAL_ENV_DISABLE_PROMPT

  if [[ -f ${HOME}/.python/bin/activate ]]; then
    # shellcheck disable=SC1090
    . "${HOME}/.python/bin/activate"
  fi
fi
