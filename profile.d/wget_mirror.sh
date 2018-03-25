# vim:ft=sh

function wget_mirror {
  wget --recursive --page-requisites --html-extension --convert-links --show-progress  --backup-converted --no-parent "$@"
}
