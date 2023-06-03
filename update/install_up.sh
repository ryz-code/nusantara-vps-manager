#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
echo -e "[INFO] Remove Old Script"
rm -rf /usr/bin/m-bot
sleep 2
echo -e "[INFO] Downloading New Script"
wget -q -O /usr/bin/m-bot "https://raw.githubusercontent.com/ryz-code/nusantara-vps-manager/autoscript/menu/m-bot.sh" && chmod +x /usr/bin/m-bot
wget -q -O /usr/bin/bot "https://raw.githubusercontent.com/ryz-code/nusantara-vps-manager/autoscript/bot/bot.sh" && chmod +x /usr/bin/bot
echo -e "[INFO] Update Successfully"

rm install_up.sh
sleep 2
exit