
#!/usr/bin/bash
#git config
git config --global user.name "Yeling Shi"
git config --global user.email yeling.shi@outlook.com
git config --global push.default upstream
git config --global i18n.commitencoding utf-8
git config --global i18n.logoutputencoding utf-8

git config --global core.quotepath false 
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

