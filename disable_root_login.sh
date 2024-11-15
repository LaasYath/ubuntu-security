#!usr/bin/env bash

echo ("Disabling root login, please ensure you are logged in as root.")
read -p "Press enter to continue..."

sed -i 's/.*root:x:0:0:root:/bin/bash.*/root:x:0:0:root:/sbin/nologin/' /etc/passwd

#confirmation message
echo "Root Login has been disabled. Please test to see it works as expected." 
