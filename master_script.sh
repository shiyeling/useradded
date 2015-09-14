#!/usr/bin/bash

#Tools installation
#install the vim-enhancement

#Tools configuration
#bash first, get the config entries from the resource/*.bash_profile file

#System configuration
#fonts:
sudo yum install levien-inconsolata-fonts adobe-source-code-pro-fonts mozilla-fira-mono-fonts google-droid-sans-mono-fonts dejavu-sans-mono-fonts
#git config
git config --global color.diff auto # git diff  要显示颜色
git config --global color.status auto # git status 要显示颜色
git config --global color.branch auto
git config --global color.ui true
git config --global core.editor vim
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.df diff
#follow github help page to generate private key and add public key to github account


#ramdisk setup for windows and linux to boost IE/Chrome performance.
# Windows full turtorial 
http://www.sevenforums.com/tutorials/312031-ram-disk-install-browser-cache-file-storage.html
# for eclipse on windows.
http://stackoverflow.com/questions/1838018/optimize-use-of-ramdisk-for-eclipse-development

# linux ramdisk setup
# http://www.observium.org/wiki/Persistent_RAM_disk_RRD_storage
sudo mkdir /mnt/ramdisk
sudo vim /etc/fstab
# add the below line to the end of /etc/fstab
#  tmpfs     /mnt/ramdisk    tmpfs defaults,size=1024M 0 0
sudo mount /mnt/ramdisk
# then you can check the mount info with mount/df
# make backup storage for ramdisk
sudo mkdir /var/ramdisk
# Create a script at /etc/init.d/ramdisk with the contents in script named ramdisk.sh in resource folder
# follow the below article to create new fedora service.
# https://kezhong.wordpress.com/2011/11/19/creating-my-own-systemd-service-files-on-fedora-16x86_64/
# https://coreos.com/docs/launching-containers/launching/getting-started-with-systemd/
# http://www.freedesktop.org/software/systemd/man/systemd.service.html
copy the ramdisk-lzop.sh file to /usr/local/bin
# copy the ramdisksync.service file to /lib/systemd/system/
sudo cp resource/ramdisksync.service /lib/systemd/system/
#make symbol link: 
sudo ln -s /lib/systemd/system/ramdisksync.service /etc/systemd/system/ramdisksync.service

sudo systemctl daemon-reload
sudo systemctl start ramdisksync.service
 sudo systemctl enable ramdisksync.service
