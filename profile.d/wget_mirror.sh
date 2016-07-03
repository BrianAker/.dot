# vim:ft=sh

function wget_mirror {
  wget --recursive --page-requisites --html-extension --convert-links --show-progress  --backup-converted --no-parent "$@"
}

if [ -z "$wget_mirror" ]; then
  export -f wget_mirror
fi

