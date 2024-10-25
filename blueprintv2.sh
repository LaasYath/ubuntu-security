echo "Finish Forensic Question"

echo "Finish password policy"

echo "Finish user access control" #echo allow-guest=false >> /usr/share/lightdm/lightdm.conf.d/50-ubuntu.con, echo autologin-user= >> /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf

echo "Let script run, try to run as root? (for the bash history command)"

echo "Run clamav run to detect malware"

echo "disable root login and change password" #seperate file for bottom two events
echo "run updates"

echo "EXTRA:"
echo "set host file to default (line 199)" #https://github.com/BiermanM/CyberPatriot-Scripts/blob/master/UbuntuScript.sh
echo "check rc.local to make sure no startup scripts are running (check comments for link to instructions, line 181)" #https://github.com/BiermanM/CyberPatriot-Scripts/blob/master/UbuntuScript.sh

#TO-DO

#install firewall + configure

  sudo apt-get install ufw -y -qq
  sudo ufw enable
  #tcp/udp specific ports generally seem insecure. udp is insecure, only want tcp
  sudo ufw deny 23 #port for telnet (service that lets computers on the network take control of each other)
  sudo ufw deny 515 #can be used for trojans & buffer overflow attacks
  sudo ufw deny 111 #can distribute a lot of info about the system
  sudo ufw deny 1337 #used by http tools, want secure browser protection
  sudo ufw deny 2049 #commonly attacked port
  sudo ufw deny 7100 #allows for buffer overflows

#autoclean and autoremove - gets rid of packages that have been downloaded but not installed (simply taking up cache space, could be malware)

  sudo apt-get autoremove -y -qq
  sudo apt-get autoclean -y -qq
  sudo apt-get clean -y -qq

#set system file permissions
  sudo chmod 640 .bash_history
  sudo chmod 604 /etc/shadow
  sudo chmod 644 /etc/hosts
  # $name = readline("Please type in your username")
  # sudo chmod 640 /home/$name/bash_history
  
#find all media files and remove
  sudo find / -name "*.mp3" -type f >> ~/congenial-disco/prohibitedFilesList.log
  sudo find / -name "*.mp4" -type f >> ~/congenial-disco/prohibitedFilesList.log
  sudo find / -name "*.wav" -type f >> ~/congenial-disco/prohibitedFilesList.log
  sudo find / -name "*.mov" -type f >> ~/congenial-disco/prohibitedFilesList.log
  sudo find / -name "*.mv" -type f >> ~/congenial-disco/prohibitedFilesList.log
  sudo find / -name "*.php" -type f >> ~/congenial-disco/prohibitedFilesList.log

#remove unwanted malware files and whatnot
  sudo find /bin/ -name "*.sh" -type f -delete # removes any script files from trash

  #Remove variances of netcat
  sudo apt-get purge netcat -y -qq
  sudo apt-get purge ncat -y -qq
  sudo apt-get purge netcat-traditional -y -qq
  sudo apt-get purge netcat-openbsd -y -qq
  sudo rm /usr/bin/nc

  #remove hydra 
  sudo apt-get purge hydra -y -qq
  sudo apt-get purge hydra-gtk -y -qq

  #remove ophcrack
  sudo apt-get purge ophcrack -y -qq
  sudo apt-get purge ophcrack-cli -y -qq

  #remove pdfcrack
  sudo apt-get purge pdfcrack -y -qq

  #sipcrack
  sudo apt-get purge sipcrack -y -qq

  #remove nginx
  sudo apt-get purge nginx -y -qq
  sudo apt-get purge nginx-common -y -qq

  #remove snmp
  sudo apt-get purge snmp -y -qq

  #remove deluge
  sudo apt-get purge deluge-common -y -qq
  sudo apt-get purge deluge-gtk -y -qq

  #remove ettercap
  sudo apt-get purge ettercap-text-only -y -qq
  sudo apt-get purge ettercap-graphical -y -qq
  
#check netstat ports and daemons

#sysctl security?

#install a bunch of need anti malware stuff

#install ssh server -> apt-get install openssh-server -y
#if they ask for configuring ssh (or not): go here: Line 215 https://github.com/Turb0Yoda/CyberPatriot-Scripts/blob/master/harden.sh
#disable root ssh
