#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
echo -e "[INFO] Remove Old Script"
rm -rf /usr/bin/m-ssh
rm -rf /opt/.ver
sleep 2
echo -e "[INFO] Downloading New Script"
wget -q -O /usr/bin/m-ssh "https://raw.githubusercontent.com/ryz-code/nusantara-vps-manager/autoscript/menu/m-ssh.sh" && chmod +x /usr/bin/m-ssh
wget -q -O /opt/.ver "https://raw.githubusercontent.com/ryz-code/nusantara-vps-manager/autoscript/update/version_up" && chmod +x /opt/.ver
echo -e "[INFO] Update Successfully"

rm install_up.sh
sleep 2
exit