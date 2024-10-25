echo "Manual To-Do: Finish Forensic Questions"

echo "Finish password policy"

echo "Finish user access control" #echo allow-guest=false >> /usr/share/lightdm/lightdm.conf.d/50-ubuntu.con, echo autologin-user= >> /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf

echo "Let script run, try to run as root? (for the bash history command)"

echo "Run clamav (malware scan file) to detect malware"

echo "disable root login and change password" #seperate file for bottom two events
echo "run updates"

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

  #denying ufw connections depending on service (comment out if service is approved)
  sudo ufw deny ftp 
  sudo ufw deny ssh
  sudo ufw deny telnet
  sudo ufw deny smtp
  sudo ufw deny printer
  sudo ufw deny http

  sudo service ssh restart
  clear

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

#disabling guest
  sudo echo "allow-guest=false" >> /etc/lightdm/lightdm.conf

#turn on audit policies
  sudo apt-get install auditd -y
  sudo auditctl -e 1 > /var/local/audit.log

#no startup scripts running
  echo > /etc/rc.local
  echo 'exit 0' >> /etc/rc.local

#install ssh server 
  sudo apt-get install openssh-server -y -qq
  sudo ufw allow ssh
  lineNum = "$(grep -n -m 1 PermitRootLogin)"
  sed -e "${lineNum}s/.*/PermitRootLogin no/" /etc/ssh/sshd_config 
  

#turn on automatic updates (just security updates, doesn't work for everythin to make sure admin vets updates)

  sudo apt-get install unattended-upgrades
  sudo dpkg-reconfigure unattended-upgrades
  
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
  sudo apt-get purge netcat* -y -qq
  sudo apt-get purge ncat* -y -qq
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

  #remover torrent
  sudo apt-get purge *torrent -y -qq  

  #remove wireshark
  sudo apt-get purge wireshark -y -qq
  
  #other
  sudo apt-get purge zenmap* -y -qq
  sudo apt-get purge nmap* -y -qq
  sudo apt-get purge john* -y -qq
  sudo apt-get purge nitko* -y -qq
  sudo apt-get purge freeciv* -y -qq
  sudo apt-get purge kismet* -y -qq
  sudo apt-get purge minetest* -y -qq

  sudo apt-get autoremove
  clear

#install a bunch of need anti malware stuff
  sudo apt-get install chkrootkit clamav rkhunter selinux tree auditd
	clear
  #does one line work?

#check netstat ports and daemons -> netstat -tulpn

#what is sysctl??

#more specific script elements to include https://github.com/konstruktoid/hardening/blob/master/scripts/auditd

#install ssh server -> apt-get install openssh-server -y
#if they ask for configuring ssh (or not)
#disable root ssh
