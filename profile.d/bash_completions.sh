# vim:ft=sh

if [ -z "$BASH_COMPLETIONS_INCLUDED" ]; then
  BASH_COMPLETIONS_INCLUDED=yes
  export BASH_COMPLETIONS_INCLUDED

	if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
		. "$(brew --prefix)/etc/bash_completion"
	fi
fi

