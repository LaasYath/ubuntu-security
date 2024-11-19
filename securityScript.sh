echo "Manual To-Do: Finish Forensic Questions"

echo "Finish password policy"

echo "Let script run, try to run as root? (for the bash history command)"

echo "Run clamav (malware scan file) to detect malware"

echo "disable root login and change password" #seperate file for bottom two events
echo "run updates"

#TO-DO
  
#install firewall + configure

echo "ENABLING FIREWALL, SETTING PORT PERMISSIONS"
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
sudo ufw allow ssh
sudo ufw deny telnet
sudo ufw deny smtp
sudo ufw deny printer
sudo ufw deny http

clear

#autoclean and autoremove - gets rid of packages that have been downloaded but not installed (simply taking up cache space, could be malware)

echo "AUTOREMOVE AND AUTOCLEAN PACKAGES"
sudo apt-get autoremove -y -qq
sudo apt-get autoclean -y -qq
sudo apt-get clean -y -qq

#set system file permissions

echo "SYSTEM FILE PERMISSIONS (ex. bash history)"
sudo chmod 640 ../.bash_history
sudo chmod 400 /etc/shadow
sudo chmod 644 /etc/hosts
# $name = readline("Please type in your username")
# sudo chmod 640 /home/$name/bash_history

#disabling guest
# echo "DISALLOW GUEST"
# sudo echo "allow-guest=false" >> /etc/lightdm/lightdm.conf

#turn on audit policies
echo 	"TURN ON AUDIT POLICIES"
sudo apt-get install auditd -y
sudo auditctl -e 1

#no startup scripts running
echo "ENSURE NO START-UP SCRIPTS ARE RUNNING"
echo > /etc/rc.local
echo 'exit 0' >> /etc/rc.local

#install ssh server 
echo "ALLOW SSH + GENERATE RSA KEYS -> make sure to switch permit root login to no"
sudo apt-get install openssh-server -y -qq
sudo ufw allow ssh

#sshd_config or ssh_config for system settings -> check ssh best file settings file.

sudo service ssh restart


#turn on automatic updates (just security updates, doesn't work for everythin to make sure admin vets updates)

echo "AUTO SECURITY UPDATES ENABLED"
sudo apt-get install unattended-upgrades
sudo dpkg-reconfigure unattended-upgrades

#find all media files and remove

echo "REMOVE MPR AND MOV FILES"
sudo find / -name "*.mp3" -type f >> mediaFiles.txt
sudo find / -name "*.mp4" -type f >> mediaFiles.txt
sudo find / -name "*.wav" -type f >> mediaFiles.txt
sudo find / -name "*.mov" -type f >> mediaFiles.txt
sudo find / -name "*.mv" -type f >> mediaFiles.txt
sudo find / -name "*.php" -type f >> mediaFiles.txt

#remove unwanted malware files and whatnot

echo "DELETE ALL TYPES OF MALWARE"
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

echo "INSTALL ANTIMALWARE SOFTWARE"
sudo apt-get install chkrootkit clamav rkhunter selinux tree auditd
clear
#does one line work?

#check netstat ports and daemons -> netstat -tulpn

#what is sysctl??

#more specific script elements to include https://github.com/konstruktoid/hardening/blob/master/scripts/auditd

#install ssh server -> apt-get install openssh-server -y
#if they ask for configuring ssh (or not)
#disable root ssh
