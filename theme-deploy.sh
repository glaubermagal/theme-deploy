#!/bin/bash
for ARGUMENT in "$@"
do
  KEY=$(echo $ARGUMENT | cut -f1 -d=)
  VALUE=$(echo $ARGUMENT | cut -f2 -d=)

  if [ "$KEY" == "--env" ]; then
    env="${VALUE}"
  fi
done

current_dir="`pwd`"
tmp_dir=$(mktemp -d -t shopify-theme-)
echo -e "STARTING...\n"
echo `rsync -av . $current_dir/* $tmp_dir | echo "Copied current files to temp"`
echo "DOWNLOADING REMOTE THEME TO TEMP FOLDER: $tmp_dir"
theme get --env=$env --dir=$tmp_dir
if [ $? == 1 ]; then
  exit
fi
theme configure --env=$env --dir=./

git_diff=`git diff --name-status --no-index $current_dir $tmp_dir`
if [ "$git_diff" != "" ]; then
  echo -e "\n$git_diff\n"

  while true; do
      read -p "The above files will be overwritten on Shopify. Would you like to continue anyway? (y/N)? " yn
      case $yn in
          [Yy]* ) break;;
          [Nn]* ) exit;;
          * ) echo "Please answer Y or N.";;
      esac
  done
fi

if [[ $env == *"production"* ]]; then
  while true; do
      read -p "You are deploying to a PRODUCTION theme. Are you sure you want to continue? (y/N) " yn
      case $yn in
          [Yy]* ) break;;
          [Nn]* ) exit;;
          * ) echo "Please answer Y or N.";;
      esac
  done
fi

echo -e "\n\nDEPLOYING THEME..."

theme deploy $@
