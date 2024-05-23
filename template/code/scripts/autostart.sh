if [[ -z $STARTUP ]]; then

  redshift -P -O 2000

  $HOME/.screenlayout/default.sh

  $HOME/.fehbg

  xss-lock -l $HOME/code/scripts/lock.sh &

  /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

  dunst &

  mpDris2 &

  if [ "`ps -e | grep mpd | wc -l`" == "0" ]; then
    mpd &
  fi

  if [ "`ps -e | grep bluetooth | wc -l`" == "0" ]; then
    systemctl restart bluetooth
  fi

  watcher -s &

  xset r rate 250 30 &

else

  xset r rate 250 30 &

fi



