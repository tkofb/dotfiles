redshift -P -O 2000

xset r rate 300 30

$HOME/.screenlayout/default.sh

$HOME/.fehbg

xss-lock -l $HOME/code/scripts/lock.sh &

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

dunst &

if [ "`ps -e | grep mpd | wc -l`" == "0" ]; then
  mpd &
fi


