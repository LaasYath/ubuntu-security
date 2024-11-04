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

sed -i 's/pam_pwquality.so*/pam_pwquality.so retry=3 minlen=10 difok=3 ucredit=-1 lcredit=-1 ocredit=-1 dcredit=-1/' /etc/pam.d/common-password
#could it be that success = 2 and that's what breaks the module, also can't be spaces betweene qual signs
sed -i 's/[success*/[success=1, default=ignore]    pam_unix.so obscure use_authtok try_first_pass yescrypt remember=5/' /etc/pam.d/common-password
