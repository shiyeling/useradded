#!/usr/bin/bash

#Tools installation
#install the vim-enhancement

#Tools configuration
#bash first, get the config entries from the resource/*.bash_profile file

#System configuration
#fonts:
sudo yum install levien-inconsolata-fonts adobe-source-code-pro-fonts mozilla-fira-mono-fonts google-droid-sans-mono-fonts dejavu-sans-mono-fonts
#git config
git config --global color.diff auto # git diff 要顯示顏色
git config --global color.status auto # git status 要顯示顏色
git config --global color.branch auto
git config --global color.ui true
git config --global core.editor vim
#follow github help page to generate private key and add public key to github account
