#!/bin/bash

#template color output
#echo -e "\e[32;1m[+] \e[0;0m"
echo -e "colorscheme torte\nset number" > ~/.vimrc
echo -e "\e[32;1m[+] Colorscheme and lines for vim\e[0;0m"

sed -i "s/#Port 22/Port 20234/g" /etc/ssh/sshd_config
echo -e "\e[32;1m[+] Changed SSH Port from 22 to 20234\e[0;0m"

systemctl daemon-reload
systemctl restart sshd
echo -e "\e[32;1m[+] Restarted SSH daemon\e[0;0m"

cp assets/banner.sh /etc/update-motd.d/30-banner
echo -e "\e[32;1m[+] Updated banner\e[0;0m"

yum install nasm gcc -y
echo -e "\e[32;1m[+] Installed NASM and GCC\e[0;0m"
