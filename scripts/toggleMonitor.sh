monitors="`xrandr --query | grep -w connected | wc -l`"

if [ $monitors == "1" ]; then
  xrandr --auto
  $HOME/.fehbg
else
  echo "Nop"
  $HOME/.screenlayout/default.sh
  $HOME/.fehbg
fi  

echo "Nope"
