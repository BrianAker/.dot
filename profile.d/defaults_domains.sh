# vim:ft=sh

function defaults_domains
{
  if [ -z "$1" ]; then
    domain_asked="$1"
  fi

  arr=$(defaults domains | tr ',' '\n')
  for element in "${arr[@]}";
  do
    if [ -z "$domain_asked" ]; then
      echo "$element" | sed 's/^ *//g' | sed 's/ *$//g'
    elif case ${element} in *"${domain_asked}"*) true;; *) false;; esac; then
      echo "Matched"
      echo "$element" | sed 's/^ *//g' | sed 's/ *$//g'
    fi
  done
}
