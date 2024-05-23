monitors="`xrandr --query | grep -w connected | wc -l`"

if [ $monitors == "1" ]; then
  xrandr --auto
  $HOME/.fehbg
else
  $HOME/.screenlayout/default.sh
  $HOME/.fehbg
fi  
