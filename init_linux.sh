#!/bin/bash/

#to enable epel repository
sudo rpm -Uvh http://mirror.steadfast.net/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
sudo yum install  levien-inconsolata-fonts adobe-source-code-pro-fonts mozilla-fira-mono-fonts google-droid-sans-mono-fonts dejavu-sans-mono-fonts
#Install tools
sudo yum install vim
sudo yum install nodejs npm









#DEV related
#meteor
curl https://install.meteor.com/ | sh
#git
git config --global user.name "Yeling Shi"
git config --global user.email shyl@zqykj.com
git config --global push.default upstream
