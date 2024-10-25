echo "Finish Forensic Question"

echo "Finish password policy"

echo "Finish user access control" echo allow-guest=false >> /usr/share/lightdm/lightdm.conf.d/50-ubuntu.con, echo autologin-user= >> /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf

echo "Let script run"

echo "Run clamav run to detect malware"

echo "run updates"

#TO-DO

#install firewall + configure

  ufw enable
  ufw deny 23
  ufw deny 2049
  ufw deny 515
  ufw deny 111
  ufw deny 7100

#autoclean and autoremove

#enable password aging

#install ssh server

#if they ask for configuring ssh (or not): go here: Line 215 https://github.com/Turb0Yoda/CyberPatriot-Scripts/blob/master/harden.sh

#disable root ssh

#find all media files and remove

#remove unwanted malware files and whatnot

#check netstat ports and daemons

#install a bunch of need anti malware stuff

