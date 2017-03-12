# vim:ft=sh

if [[ -z "$PERLRC_INCLUDED" ]]; then
  PERLRC_INCLUDED=yes
  export PERLRC_INCLUDED

  PERL_CPANM_OPT="--prompt --reinstall -l ~/Library/Perl5"
  export PERL_CPANM_OPT
  # shellcheck disable=SC2086
  if [[ -f "$HOME/" ]]; then
    eval "$(perl -I$HOME/Library/Perl5/lib/perl5/ -Mlocal::lib=$HOME/Library/Perl5)"
  fi
fi
