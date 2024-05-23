status="`git status 2> /dev/null | tail -n 1 | colrm  18 400`"


# COLORS
blue=$(tput setaf 4)
red=$(tput setaf 136)
pink=$(tput setaf 214)
normal=$(tput sgr0)
winter="$blue‎winter: $normal"

if [ -z "$status" ]; then
  echo "$pink[NO GIT REPO]$normal"
  exit
fi

if [ "$status" == "nothing to commit" ]; then
  echo "$pink[Nothing To Commit]$normal"
  exit
fi

echo "[Do you want to commit all of your files [y/n]]"
echo -n "$winter"
read commit_all

if [ -z "$commit_all" ]; then
  echo "$red[All Files Added]$normal"
  git add *
elif [ $commit_all == "y" ]; then
  echo "$red[All Files Added]$normal"
  git add *
else
  echo "$red[Which files do you want to add?]$normal"
  echo "$pink[All Files]$normal"
  lsd
  echo "$pink[Files Not Added]$normal"
  git status
  echo " "
  echo -n "$winter"
  read commits
  git add $commits
fi

echo "$pink[What is the description of the commit?]$normal"
echo -n "$winter"
read message
git commit -m "$message"

echo "$pink[Do you want to push your files [y/n] [default:n]]$normal"
echo -n "$winter"
read push_files

if [ -z "$push_files" ]; then
  exit
elif [ $push_files == "n" ]; then
  exit
else
  git push 
fi

