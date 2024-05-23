date="`date "+%D"`"
weather="`python $HOME/code/scripts/weather.py`"
time="`date "+%r"`"
day="`date "+%A"`"
battery="`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|to full|percentage" | tail -n 1 | colrm 1 25`"

curr_dr="`pwd`"

if [[ "$1" != "fast" ]]; then
  cd $HOME/code/scripts/mail
  mail="`python maily.py`"
  cd $curr_dr 

  cd $HOME/code/next_meeting
  next_meeting="`python $HOME/code/next_meeting/next_meeting.py`"
  cd $curr_dr 
fi

dunstify "time 󰥔 " "$time"
dunstify "date 󰝮 " "$date"
dunstify "day  " "$day"
dunstify "weather 󰓠 " "$weather" 
dunstify "battery 󰁹 " "$battery"

if [[ "$1" != "fast" ]]; then
  dunstify "calendar 󰧓 " "$next_meeting"

  if [[ "$mail" != "0" ]]; then
    dunstify "mail 󰛮 " "$mail"
  fi
fi
