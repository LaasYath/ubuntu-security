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
service sshd stop
service telnet stop # Remote Desktop Protocol
service vsftpd stop # FTP server
service snmp stop # Type of email server
service pop3 stop # Type of email server
service icmp stop # Router communication protocol
service sendmail stop # Type of email server
service dovecot stop # Type of email server
service --status-all | grep "+" # shows what services are on
