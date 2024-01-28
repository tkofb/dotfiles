date="`date "+%D"`"
weather="`python $HOME/code/scripts/weather.py`"
time="`date "+%r"`"
day="`date "+%A"`"
battery="`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|to full|percentage" | tail -n 1 | colrm 1 25`"

curr_dr="`pwd`"
cd $HOME/code/scripts/mail
mail="`python maily.py`"
cd $curr_dr 


dunstify "time 󰥔 " "$time"
dunstify "date 󰸗 " "$date"
dunstify "day  " "$day"
dunstify "weather 󰓠 " "$weather" 
dunstify "battery 󰁹 " "$battery"

if [[ "$mail" != "0" ]]; then
  dunstify "mail 󰛮 " "$mail"
fi
