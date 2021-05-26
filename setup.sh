#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
                echo "You need to run this script as root"
                exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
                echo "OpenVZ is not supported"
                exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
purple='\e[0;35m'
orange='\e[0;33m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
# Letak Password Kamu
Password=12994920912909
# Eksekusi
echo -e "${purple}WELCOME TO PREMIUM AUTOSCRIPTS BY VINSTECHMY${NC}"
echo -e ""
echo -e "${orange}TO PURCHASE THE LICENSE KEY PLEASE CONTACT ADMIN${NC}"
echo -e ""
echo -e "${green}TELEGRAM : t.me/vinstechmy${NC}"
echo -e ""
echo -e "${green}PREMIUM AUTOSCRIPT LICENSE KEY PRICE${NC}"
echo -e ""
echo -e "LIFETIME SCRIPT & UNLIMITED VPS INSTALLATION : ${orange}RM85/20USD${NC}"
echo -e ""
echo -e "LIFETIME SCRIPT & 1 VPS INSTALLATION : ${orange}RM30/7USD${NC}"
echo -e ""
read -p "PLEASE INSERT THE LICENSE KEY : " Passwordnya

if [ $Password = $Passwordnya ]; then
echo -e "${green}Permission Accepted...${NC}"
echo ""
echo -e "IP Register ! Thanks For Buying The Autoscript"
echo ""
else
echo -e "${red}Permission Denied!${NC}";
echo ""
echo -e "Please Contact Admin"
echo -e "Telegram t.me/vinstechmy"
echo ""
rm -f setup.sh
exit 0
fi
if [ -f "/etc/v2ray/domain" ]; then
echo "Script Already Installed"
exit 0
fi
mkdir /var/lib/premium-script;
echo "IP=" >> /var/lib/premium-script/ipvps.conf
wget https://raw.githubusercontent.com/obitofaiz/vinstechmy/main/cf.sh && chmod +x cf.sh && ./cf.sh
#install ssh ovpn
wget https://raw.githubusercontent.com/obitofaiz/vinstechmy/main/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
wget https://raw.githubusercontent.com/obitofaiz/vinstechmy/main/sstp.sh && chmod +x sstp.sh && screen -S sstp ./sstp.sh
#install ssr
wget https://raw.githubusercontent.com/obitofaiz/vinstechmy/main/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh
wget https://raw.githubusercontent.com/obitofaiz/vinstechmy/main/sodosok.sh && chmod +x sodosok.sh && screen -S ss ./sodosok.sh
#installwg
wget https://raw.githubusercontent.com/obitofaiz/vinstechmy/main/wg.sh && chmod +x wg.sh && screen -S wg ./wg.sh
#install v2ray
wget https://raw.githubusercontent.com/obitofaiz/vinstechmy/main/ins-vt.sh && chmod +x ins-vt.sh && screen -S v2ray ./ins-vt.sh
#install L2TP
wget https://raw.githubusercontent.com/obitofaiz/vinstechmy/main/ipsec.sh && chmod +x ipsec.sh && screen -S ipsec ./ipsec.sh
wget https://raw.githubusercontent.com/obitofaiz/vinstechmy/main/set-br.sh && chmod +x set-br.sh && ./set-br.sh

rm -f /root/ssh-vpn.sh
rm -f /root/sstp.sh
rm -f /root/wg.sh
rm -f /root/ss.sh
rm -f /root/ssr.sh
rm -f /root/ins-vt.sh
rm -f /root/ipsec.sh
rm -f /root/set-br.sh
cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=https://vpnstores.net

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
wget -O /etc/set.sh "https://raw.githubusercontent.com/obitofaiz/vinstechmy/main/set.sh"
chmod +x /etc/set.sh
history -c
echo "1.2" > /home/ver
clear
echo " "
echo "Installation has been completed!!"
echo " "
echo "=================================-Autoscript Premium-===========================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "--------------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 442"  | tee -a log-install.txt
echo "   - Stunnel4                : 443, 777"  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080 (limit to IP Server)"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 81"  | tee -a log-install.txt
echo "   - Wireguard               : 7070"  | tee -a log-install.txt
echo "   - L2TP/IPSEC VPN          : 1701"  | tee -a log-install.txt
echo "   - PPTP VPN                : 1732"  | tee -a log-install.txt
echo "   - SSTP VPN                : 444"  | tee -a log-install.txt
echo "   - Shadowsocks-R           : 1443-1543"  | tee -a log-install.txt
echo "   - SS-OBFS TLS             : 2443-2543"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP            : 3443-3543"  | tee -a log-install.txt
echo "   - V2RAY Vmess TLS         : 8443"  | tee -a log-install.txt
echo "   - V2RAY Vmess None TLS    : 80"  | tee -a log-install.txt
echo "   - V2RAY Vless TLS         : 2083"  | tee -a log-install.txt
echo "   - V2RAY Vless None TLS    : 8880"  | tee -a log-install.txt
echo "   - Trojan                  : 2087"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   - Dev/Main                : Vinstechmy"  | tee -a log-install.txt
echo "   - Telegram                : t.me/vinstechmy"  | tee -a log-install.txt
echo "   - Whatsapp                : 01160938070"  | tee -a log-install.txt
echo "   - Facebook                : https://www.facebook.com/wdpspidey" | tee -a log-install.txt
echo "---------------------------------Autoscript By Vinstechmy-----------------------" | tee -a log-install.txt
echo ""
echo " Reboot in 5 second"
sleep 5
rm -f setup.sh
reboot