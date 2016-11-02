#!/bin/bash
dir=$(dirname `readlink -f $0`)
list=(`cat "$dir/aptget"`)

sudo chown -R zhengkai:zhengkai /home/zhengkai

mkdir -p ~/.backup

sudo apt-get update

sudo apt-get install -y vim
sudo update-alternatives --set editor /usr/bin/vim.basic

sudo apt-get install -y ${list[@]}

sudo apt-get remove -y fonts-droid

sudo sh -c 'echo "Asia/Shanghai" > /etc/timezone'
sudo cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

mkdir -p ~/.tmp
mkdir -p ~/.backup

bashcomp_dir='/etc/bash_completion.d'
if [ -d $bashcomp_dir ]; then
	sudo cp "$dir/file/pman" $bashcomp_dir
fi

sudo easy_install3 -U pip

sudo -H pip install --upgrade httpie
sudo -H pip install --upgrade qrcode
sudo -H pip install --upgrade tldr
sudo -H pip3 install --upgrade thefuck

sudo adduser zhengkai www-data

sudo chown -R zhengkai:zhengkai /home/zhengkai

sed "s/[[:blank:]]*$//" aptget | sort | uniq | sponge aptget
