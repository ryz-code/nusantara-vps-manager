#!/bin/bash

clear
fun_bar() {
    comando[0]="$1"
    comando[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${comando[0]} -y >/dev/null 2>&1
        ${comando[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "\033[1;33m["
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[1;31m#"
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[1;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "\033[1;33m["
    done
    echo -e "\033[1;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
    tput cnorm
}

fun_botOnOff() {
    [[ $(ps x | grep "bot_plus" | grep -v grep | wc -l) = '0' ]] && {
        clear
        echo -e "\E[44;1;37mㅤNUSANTARA VPS MANAGERㅤTELE BOT INSTALLERㅤ\E[0m\n"
        echo -ne "\033[1;32m◇ INFORM YOUR BOT TOKEN:\033[1;37m "
        read tokenbot
        echo ""
        echo -ne "\033[1;32m◇ INFORM YOUR TELEGRAM ID:\033[1;37m "
        read iduser
        clear
        echo -e "\033[1;32mㅤㅤNUSANTARA VPS MANAGERㅤTELE BOT STARTING...ㅤㅤ\033[0m\n"
        fun_bot1() {
        	[[ "$(grep -wc '16' /etc/issue.net)" != '0' ]] && {
        		wget -qO- https://raw.githubusercontent.com/ryz-code/nusantara-vps-manager/main/Install/ShellBot.sh > /etc/VPSManager/ShellBot.sh
        	}
            [[ ! -e "/etc/VPSManager/ShellBot.sh" ]] && {
				wget -qO- https://raw.githubusercontent.com/ryz-code/nusantara-vps-manager/main/Install/ShellBot.sh >/etc/VPSManager/ShellBot.sh
			}
            cd /etc/VPSManager
            screen -dmS bot_plus ./bot $tokenbot $iduser >/dev/null 2>&1
            [[ $(grep -wc "bot_plus" /etc/autostart) = '0' ]] && {
                echo -e "ps x | grep 'bot_plus' | grep -v 'grep' || cd /etc/VPSManager && sudo screen -dmS bot_plus ./bot $tokenbot $iduser && cd $HOME" >>/etc/autostart
            } || {
                sed -i '/bot_plus/d' /etc/autostart
                echo -e "ps x | grep 'bot_plus' | grep -v 'grep' || cd /etc/VPSManager && sudo screen -dmS bot_plus ./bot $tokenbot $iduser && cd $HOME" >>/etc/autostart
            }
            [[ $(crontab -l | grep -c "verifbot") = '0' ]] && (
                crontab -l 2>/dev/null
                echo "@daily /bin/verifbot"
            ) | crontab -
            cd $HOME
        }
        fun_bar 'fun_bot1'
        [[ $(ps x | grep "bot_plus" | grep -v grep | wc -l) != '0' ]] && echo -e "\n\033[1;32m🐉ㅤDRAGON VPS MANAGERㅤTELE BOT ENABLED!ㅤ🐉\033[0m" || echo -e "\n\033[1;31m◇ MISTAKE! REANALYZE YOUR INFORMATION\033[0m"
        sleep 2
        menu
    } || {
        clear
        echo -e "\033[1;32mㅤDRAGON VPS MANAGERㅤTELE BOT STOPPING...ㅤ🐉\033[0m\n"
        fun_bot2() {
            screen -r -S "bot_plus" -X quit
            screen -wipe 1>/dev/null 2>/dev/null
            [[ $(grep -wc "bot_plus" /etc/autostart) != '0' ]] && {
                sed -i '/bot_plus/d' /etc/autostart
            }
            [[ $(crontab -l | grep -c "verifbot") != '0' ]] && crontab -l | grep -v 'verifbot' | crontab -
            sleep 1
        }
        fun_bar 'fun_bot2'
        echo -e "\n\033[1;32m \033[1;31m🐉ㅤDRAGON VPS MANAGERㅤTELE BOT STOPPED!ㅤ🐉\033[0m"
        sleep 2
        menu
    }
}

fun_instbot() {
    echo -e "\E[44;1;37mㅤ🐉ㅤDRAGON VPS MANAGERㅤTELE BOT INSTALLERㅤ🐉ㅤ\E[0m\n"
    echo -e "                 \033[1;33m[\033[1;31m!\033[1;33m] \033[1;31mATTENTION! \033[1;33m[\033[1;31m!\033[1;33m]\033[0m"
    echo -e "\n\033[1;32m1° \033[1;37m- \033[1;33mTHROUGH YOUR TELEGRAM ACCOUNT, ACCESS THE FOLLOWING BOT\033[1;37m:\033[0m"
    echo -e "\n\033[1;32m2° \033[1;37m- \033[1;33mBOT \033[1;37m@BotFather \033[1;33mCREATE YOUR BOT \033[1;31mSEND TO @Botfather: \033[1;37m/newbot\033[0m"
    echo -e "\n\033[1;32m3° \033[1;37m- \033[1;33mBOT \033[1;37m@TwincyBot \033[1;33mAND GET YOUR ID \033[1;31mSEND TO @TwincyBot: \033[1;37m/id\033[0m"
    echo -e "\033[0;34m◇────────────────────────────────────────────────◇\033[1;32m"
    echo ""
    read -p "◇ DO YOU WISH TO CONTINUE ? [s/n]: " -e -i s resposta
    [[ "$resposta" = 's' ]] && {
        fun_botOnOff
    } || {
        echo -e "\n\033[1;31m◇ Returning...\033[0m"
        sleep 2
        menu
    }
}
[[ -f "/etc/VPSManager/ShellBot.sh" ]] && fun_botOnOff || fun_instbot
#fim
