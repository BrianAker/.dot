# vim:ft=sh

salt () {
  SALT16="$(head -c 512 /dev/random | sha1sum | cut -b 1-16)"
  export SALT16
}
