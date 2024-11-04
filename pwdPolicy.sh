#!usr/bin/env bash

echo "STILL NEED TO TEST"
echo "setting user policy, make sure to log in as root"
read -a y

apt install libpam-pwquality

sed -i 's/PASS_MAX_DAYS*/PASS_MAX_DAYS  60/' /etc/login.defs
sed -i 's/PASS_MIN_DAYS*/PASS_MIN_DAYS  1/' /etc/login.defs
sed -i 's/PASS_WARN_AGE*/PASS_WARN_AGE  7/' /etc/login.defs
sed -i 's/LOGIN_RETRIES*/LOGIN_RETRIES  3/' /etc/login.defs
sed -i 's/LOGIN_TIMEOUT*/LOGIN_TIMEOUT  60/' /etc/login.defs
