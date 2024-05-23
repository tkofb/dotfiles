destination=$2
command=$1
currDesktop="`bspc query -d 'focused' -D --names`"

romanToInt () {
  if [[ $1 == "I" ]]; then
    echo 1
  elif [[ $1 == "II" ]]; then
    echo 2
  elif [[ $1 == "III" ]]; then
    echo 3
  elif [[ $1 == "IV" ]]; then
    echo 4
  elif [[ $1 == "V" ]]; then
    echo 5
  elif [[ $1 == "IV" ]]; then
    echo 6
  elif [[ $1 == "IIV" ]]; then
    echo 7
  elif [[ $1 == "IIIV" ]]; then
    echo 8
  elif [[ $1 == "IX" ]]; then
    echo 9
  elif [[ $1 == "X" ]]; then
    echo 10
  fi
}

echo "$1 $2" > /usr/log/log.txt

currDesktop="`romanToInt $currDesktop`"

if ! [[ $currDesktop == $destination ]]; then
  bspc $command $destination
else
  bspc desktop -f prev.occupied
fi


