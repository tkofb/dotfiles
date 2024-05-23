currentLayout="`setxkbmap -print -verbose 10 | grep layout | awk '{print $2}'`"

if [[ $currentLayout == "us" ]]; then
  setxkbmap es
else
  setxkbmap us
fi
