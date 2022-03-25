# vim:filetype=zsh
# .zshrc

PS1="%n@%m:%~ %# "
export PS1

alias vi="vim"

if [ -f "$HOME"/.customrc ]; then
  # shellcheck disable=SC1091 disable=SC1090
  . "$HOME"/.customrc
fi

# Enable ctrl-a and ctrl-e
bindkey -e
