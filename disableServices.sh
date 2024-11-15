#delete any services you want to keep and then delete this, dpkg -l find package names and remove
# ssh
# ftp
# avahi
# apache
# samba
# telnet
# vsftpd
# mail
# print
# db
# dns

#delete any services you want to keep and then delete this, dpkg -l find package names and remove (optional)
sudo systemctl disable --now nginx
sudo systemctl disable --now dovecot
sudo systemctl disable --now sendmail
sudo systemctl disable --now icmp
sudo systemctl disable --now pop3
sudo systemctl disable --now snmp
sudo systemctl disable --now vsftpd
sudo systemctl disable --now telnet
sudo systemctl disable --now ssh
service --status-all | grep "+" # shows what services are on
