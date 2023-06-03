#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
echo -e "[INFO] Remove Old Script"
rm -rf /usr/bin/menu
rm -rf /usr/bin/m-ss
rm -rf /usr/bin/m-vmess
rm -rf /usr/bin/m-vless
rm -rf /usr/bin/m-trojan
rm -rf /usr/bin/m-bot
rm -rf /usr/bin/m-ssh
rm -rf /usr/bin/m-set
rm -rf /usr/bin/m-backup
rm -rf /usr/bin/m-ip
rm -rf /usr/bin/m-autoboot
rm -rf /usr/bin/m-bot-tg
rm -rf /usr/bin/m-tcp
rm -rf /usr/bin/rebootvps
rm -rf /usr/bin/m-dns
rm -rf /usr/bin/info
rm -rf /usr/bin/m-speed
rm -rf /usr/bin/m-bandwith
rm -rf /opt/.ver
sleep 2
echo -e " [INFO] Downloading New Script"
wget -qc -O /usr/bin/menu "https://raw.githubusercontent.com/ryz-code/nusantara-vps-manager/autoscript/menu/menu.sh" && chmod +x /usr/bin/menu
wget -q -O /usr/bin/m-ss "https://raw.githubusercontent.com/ryz-code/nusantara-vps-manager/autoscript/menu/m-ss.sh" && chmod +x /usr/bin/m-ss
wget -q -O /usr/bin/m-vmess "https://raw.githubusercontent.com/ryz-code/nusantara-vps-manager/autoscript/menu/m-vmess.sh" && chmod +x /usr/bin/m-vmess
wget -q -O /usr/bin/m-vless "https://raw.githubusercontent.com/ryz-code/nusantara-vps-manager/autoscript/menu/m-vless.sh" && chmod +x /usr/bin/m-vless
wget -q -O /usr/bin/m-trojan "https://raw.githubusercontent.com/ryz-code/nusantara-vps-manager/autoscript/menu/m-trojan.sh" && chmod +x /usr/bin/m-trojan
wget -q -O /usr/bin/m-bot "https://raw.githubusercontent.com/ryz-code/nusantara-vps-manager/autoscript/menu/m-bot.sh" && chmod +x /usr/bin/m-bot
wget -q -O /usr/bin/m-ssh "https://raw.githubusercontent.com/ryz-code/nusantara-vps-manager/autoscript/menu/m-ssh.sh" && chmod +x /usr/bin/m-ssh
wget -q -O /usr/bin/m-set "https://raw.githubusercontent.com/ryz-code/nusantara-vps-manager/autoscript/menu/m-set.sh" && chmod +x /usr/bin/m-set
wget -q -O /usr/bin/m-theme "https://raw.githubusercontent.com/ryz-code/nusantara-vps-manager/autoscript/menu/m-theme.sh" && chmod +x /usr/bin/m-theme
wget -q -O /usr/bin/m-backup "https://raw.githubusercontent.com/ryz-code/nusantara-vps-manager/autoscript/menu/m-backup.sh" && chmod +x /usr/bin/m-backup
wget -q -O /usr/bin/m-ip "https://raw.githubusercontent.com/ryz-code/nusantara-vps-manager/autoscript/menu/m-ip.sh" && chmod +x /usr/bin/m-ip
wget -q -O /usr/bin/autoboot "https://raw.githubusercontent.com/ryz-code/nusantara-vps-manager/autoscript/addon/autoboot.sh" && chmod +x /usr/bin/autoboot
wget -q -O /usr/bin/bot-tg "https://raw.githubusercontent.com/ryz-code/nusantara-vps-manager/autoscript/bot/bot-tg.sh" && chmod +x /usr/bin/bot-tg
wget -q -O /usr/bin/m-tcp "https://raw.githubusercontent.com/ryz-code/nusantara-vps-manager/autoscript/menu/m-tcp.sh" && chmod +x /usr/bin/m-tcp
wget -q -O /usr/bin/rebootvps "https://raw.githubusercontent.com/ryz-code/nusantara-vps-manager/autoscript/addon/rebootvps.sh" && chmod +x /usr/bin/rebootvps
wget -q -O /usr/bin/m-dns "https://raw.githubusercontent.com/ryz-code/nusantara-vps-manager/autoscript/menu/m-dns.sh" && chmod +x /usr/bin/m-dns
wget -q -O /usr/bin/info "https://raw.githubusercontent.com/ryz-code/nusantara-vps-manager/autoscript/addon/info.sh" && chmod +x /usr/bin/info
wget -q -O /usr/bin/m-speed "https://raw.githubusercontent.com/ryz-code/nusantara-vps-manager/autoscript/menu/m-speedtest.sh" && chmod +x /usr/bin/m-speed
wget -q -O /usr/bin/m-bandwith "https://raw.githubusercontent.com/ryz-code/nusantara-vps-manager/autoscript/menu/m-bandwith.sh" && chmod +x /usr/bin/m-bandwith
wget -qc -o /opt/.ver "https:https://raw.githubusercontent.com/ryz-code/nusantara-vps-manager/autoscript/update/version_up" && chmod +x /opt/.ver
echo -e " [INFO] Update Successfully"

rm install_up.sh
sleep 2
exit