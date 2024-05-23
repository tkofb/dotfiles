currDir=`pwd`

echo $currDir

cd $HOME/screenshots

screenshot_name=`zenity --entry --title="Screenshot" --text="Enter Screenshot Name:"`
echo "Take Screenshot: "

REGEX='^[A-Za-z0-9]*.png$'

if ! [[ $screenshot_name =~ $REGEX ]]; then
  screenshot_name="$screenshot_name.png"
else
  screenshot_name=$screenshot_name
fi

scrot -s $screenshot_name
echo "SCREENSHOT COMPLETED"

cd $currDir
