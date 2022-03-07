#!/bin/bash

# Allow this script to create local aliases
shopt -s expand_aliases

# df == dotfiles
alias df='/usr/bin/git --git-dir=/home/omer/.config/dotfiles.git --work-tree=/home/omer'

changed_files=$(df status | awk '/modified/{print $2}')

if [ ! -z "$changed_files" ]; then
	df add "$changed_files"
	df commit -m "Automatic commit which were commited by using a crontab job"
	df pull -r
	df push -u origin main
fi
