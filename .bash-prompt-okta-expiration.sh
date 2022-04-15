function okta_expiration_prompt() {
  f=~/.aws/credentials
  mod_date=$( stat --format=%Y $f ) # file modification date
  cur_date=$( date +%s ) # current date

  e=$(( 60 - ($cur_date - $mod_date)/60 )) # minutes left
  if [ $e -lt 0 ]; then
    return
  elif [ $e -lt 15 ]; then
    clr=31
  elif [ $e -lt 40 ]; then
    clr=93
  else
    clr=92
  fi

  echo -e " \e[${clr}mOKTA:$e\e[39m "
}
