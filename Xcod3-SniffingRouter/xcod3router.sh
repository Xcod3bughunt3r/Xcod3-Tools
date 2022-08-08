#!/bin/bash
# Developers : ALIF FUSOBAR - master@itsecurity.id - www.itsecurity.id
#Program ini dapat digunakan untuk personal ataupun komersial.

again='y'
while [[ $again == 'Y' ]] || [[ $again == 'y' ]];
do
clear
echo "====================================================================";
echo " Xcod3 Router for Ubuntu 16.04 Server                      ";
echo " Developers : ALIF FUSOBAR - master@itsecurity.id - www.itsecurity.id                                 ";
echo " Version 2.0 - 09/08/2022                                          ";
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-";
echo " Router & Server pendukung router                                   ";
echo " [1]  Install Xcod3 Router                                 ";
echo " [2]  Setting IP Address untuk eth0 dan eth1                        ";
echo " [3]  Install NAT, DHCP Server & Bandwidth monitoring               ";
echo " [4]  Install Squid (Otomatis aktif untuk access_log)               ";
echo " [5]  Setting DHCP Server                                           ";
echo " [6]  Jalankan monitoring Bandwidth                                 ";
echo " [7]  Port Forwarding                                               ";
echo " [8]  Pasang Squid + Log (transparent)                              ";
echo " [9]  Pasang Squid + Log + Cache (transparent)                      ";
echo " [10] Install VPN Server PPTP                                       ";
echo " [11] Setting ip client VPN Server                                  ";
echo " [12] Setting Password VPN Server                                   ";
echo " [13] Setting ms-dns pada VPN Server                                ";
echo " =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=";
echo " Log dan lainnya                                                    ";
echo " [14] Lihat user yang mendapatkan akses dari DHCP Server            ";
echo " [15] Lihat log website yang dibuka client                          ";
echo " [16] Lihat ukuran cache squid                                      ";
echo " [17] Edit squid.conf                                               ";
echo " [18] Reset rc.local hanya untuk NAT otomatis jika direstart        ";
echo " [19] Edit rc.local                                                 ";
echo " [20] Pindah ke Xcod3 Sniffing Router                              ";
echo " [21] Reboot                                                        ";
echo " [22] Exit                                                          ";
echo "====================================================================";
read -p " Masukkan Nomor Pilihan Anda [1 - 22] : " choice;
echo "";
case $choice in
1)  if [ -z "$(sudo ls -A /etc/default/grub)" ]; then
    echo "Tidak terdeteksi grub, anda yakin pakai Ubuntu 16.04 ?"
    else
    sudo apt-get install shellinabox
    sudo rm /etc/profile.d/myscript.sh
    sudo ln -s /Xcod3-SniffingRouter/xcod3router.sh /etc/profile.d/myscript.sh
    sudo cp /Xcod3-SniffingRouter/support/shellinabox /etc/default
    sudo cp /Xcod3-SniffingRouter/support/grub /etc/default/grub
    sudo grub-mkconfig -o /boot/grub/grub.cfg
    sudo cp /Xcod3-SniffingRouter/support/resolved.conf /etc/systemd/
    sudo systemctl restart systemd-resolved
    sudo cp /Xcod3-SniffingRouter/support/interfaces /etc/network/
    sudo cp /Xcod3-SniffingRouter/support/rc.local /etc
    sudo apt-get install arp-scan
    sudo nano /etc/network/interfaces
    read -p "Tekan enter untuk restart"
    sudo systemctl reboot -i
    fi
    ;;
2)  if [ -z "$(ls -l /etc/network/interfaces)" ]; then
    echo "Tidak terdeteksi ada /etc/network/interfaces"
    else
    sudo nano /etc/network/interfaces
    read -p "Apakah anda mau restart koneksi eth0 & eth1 sekarang? y/n :" -n 1 -r
    echo 
        if [[ ! $REPLY =~ ^[Nn]$ ]]
        then
        sudo ip addr flush eth0 && sudo systemctl restart networking.service
        sudo ip addr flush eth1 && sudo systemctl restart networking.service
        sudo ifconfig
        fi
    fi
    ;;
3)  read -p "Apakah anda mau yakin mau install NAT, DHCP Server, dan iptraf ? y/n :" -n 1 -r
    echo  ""
    if [[ ! $REPLY =~ ^[Nn]$ ]]
    then
    sudo sysctl -w net.ipv4.ip_forward=1
    sudo /sbin/iptables -P FORWARD ACCEPT
    sudo /sbin/iptables --table nat -A POSTROUTING -o eth0 -j MASQUERADE
    sudo cp /Xcod3-SniffingRouter/support/rc.local /etc
    echo "NAT sudah diinstall"
    sudo apt-get install isc-dhcp-server
    sudo mv /etc/dhcp/dhcp.conf /tmp
    sudo cp /Xcod3-SniffingRouter/support/dhcpd.conf /etc/dhcp
    sudo nano /etc/dhcp/dhcpd.conf
    sudo service isc-dhcp-server restart
    echo "DHCP Server sudah diinstall"
    sudo apt-get install iptraf
    echo "iptraff sudah diinstall"
    fi
    ;;

4)  read -p "Apakah anda yakin install Squid (Default : access_log enabled, cache : disabled) ? y/n :" -n 1 -r
    echo  ""
    if [[ ! $REPLY =~ ^[Nn]$ ]]
    then
    if [ -z "$(ls -l /etc/squid/squid.conf)" ]; then
    sudo apt-get install squid3 
    iplan2="$(ifconfig | grep -A 1 'eth1' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1)"
    sudo rm /etc/squid/squid.conf
    sudo cp /Xcod3-SniffingRouter/support/squid1/squid.conf /etc/squid/
    sudo iptables -t nat -A PREROUTING -i eth1 -p tcp -m tcp --dport 8080 -j DNAT --to-destination $iplan2:3127
    sudo sed -i "/exit 0/i\sudo iptables -t nat -A PREROUTING -i eth1 -p tcp -m tcp --dport 80 -j DNAT --to-destination "$iplan2":3127" /etc/rc.local
    read -p "Log akan aktif jika linux sudah dilakukan restart"
    echo "Squid sudah diinstall"
    else
    echo "Squid sudah ada, tidak perlu diinstall lagi"
    fi
    fi
    ;;


5)  if [ -z "$(ls -A /etc/dhcp/dhcpd.conf)" ]; then
    echo "Tidak terdeteksi DHCP Server"
    else
    echo "Setting DHCP Server"
    sudo nano /etc/dhcp/dhcpd.conf
    sudo service isc-dhcp-server restart
    fi
    ;;   

6) sudo iptraf
    ;;


7) echo "Isi file rc.local :"
    sudo cat /etc/rc.local
    ipwan="$(ifconfig | grep -A 1 'eth0' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1)"
    echo "Daftar ip LAN yang dapat dituju :"
    sudo arp-scan --interface=eth1 --localnet
    echo -n "Masukkan ip LAN pada server yang dituju : "
    read iplan
    echo -n "Masukkan nomor port yang akan diforward : "
    read portip
    sudo sysctl -w net.ipv4.ip_forward=1
    sudo iptables -t nat -A PREROUTING -j DNAT -d $ipwan -p tcp --dport $portip --to $iplan
    sudo sed -i "/exit 0/i\sudo iptables -t nat -A PREROUTING -j DNAT -d "$ipwan" -p tcp --dport "$portip" --to "$iplan"" /etc/rc.local
    ;;

8) if [ -z "$(ls -A /etc/squid/squid.conf)" ]; then
    echo "Squid tidak terdeteksi"
    else
    sudo rm /etc/squid/squid.conf
    sudo cp /Xcod3-SniffingRouter/support/squid1/squid.conf /etc/squid/
    echo "Access_log : Enabled, Cache : disabled"
    read -p "Log akan aktif jika linux sudah dilakukan restart"
    fi
    ;;

9) if [ -z "$(ls -l /etc/squid/squid.conf)" ]; then
    echo "Squid tidak terdeteksi"
    else
    sudo rm /etc/squid/squid.conf
    sudo cp /Xcod3-SniffingRouter/support/squid2/squid.conf /etc/squid/
    echo "Access_log : Enabled, Cache : enabled"
    read -p "Log akan aktif jika linux sudah dilakukan restart"
    fi
    ;;

10) read -p "Apakah anda yakin install VPN Server PPTP  ? y/n :" -n 1 -r
    echo  ""
    if [[ ! $REPLY =~ ^[Nn]$ ]]
    then
    if [ -z "$(ls -l /etc/pptpd.conf)" ]; then
    echo "Install PPTP Server" 
    sudo apt-get install pptpd
    sudo cp /Xcod3-SniffingRouter/support/pptpd.conf /etc
    sudo cp /Xcod3-SniffingRouter/support/chap-secrets /etc/ppp
    sudo cp /Xcod3-SniffingRouter/support/ppptpd-options /etc/ppp
    sudo nano /etc/pptpd.conf
    sudo nano /etc/ppp/chap-secrets
    sudo nano /etc/ppp/pptpd-options
    sudo service pptpd restart
    else
    echo "Sudah ada PPTP Server"
    fi
    fi
    ;;

11) if [ -z "$(ls -l /etc/pptpd.conf)" ]; then
    echo "Tidak terdeteksi file pptpd.conf pada VPN Server"
    else
    echo "Edit pptpd.conf" 
    sudo nano /etc/pptpd.conf
    sudo service pptpd restart
    fi
    ;;

12) if [ -z "$(ls -l /etc/ppp/chap-secrets)" ]; then
    echo "Tidak terdeteksi file chap-secrets pada VPN Server"
    else
    echo "Edit file chap-secrets" 
    sudo nano /etc/ppp/chap-secrets
    sudo service pptpd restart
    fi
    ;;

13) if [ -z "$(ls -l /etc/pptpd.conf)" ]; then
    echo "Tidak terdeteksi file pptpd-options pada VPN Server"
    else
    echo "Edit file pptpd-options" 
    sudo nano /etc/ppp/pptpd-options
    sudo service pptpd restart
    fi
    ;;

14) if [ -z "$(ls -l /var/lib/dhcp/dhcpd.leases)" ]; then
    echo "Tidak terdeteksi DHCP Server"
    else
    sudo perl /Xcod3-SniffingRouter/support/dhcplist.pl
    fi 
    ;;
 
15) if [ -z "$(ls -l /var/log/squid/access.log)" ]; then
    echo "Tidak terdeteksi log access pada squid"
    else
    sudo nano /var/log/squid/access.log
    fi
    ;;

16) sudo du -s /var/spool/squid
    read -p "Tekan enter untuk melanjutkan"
    ;;

17) if [ -z "$(ls -l /etc/squid/squid.conf)" ]; then
    echo "Tidak terdeteksi squid"
    else
    sudo nano /etc/squid/squid.conf
    fi
    ;;

18) if [ -z "$(sudo ls -A /etc/rc.local)" ]; then
    echo "Tidak terdeteksi ada file rc.local di /etc/"
    else
    echo "File rc.local di folder /etc/ disisipkan NAT dan HBT"
    sudo cp /Xcod3-SniffingRouter/support/rc.local /etc
    fi
    ;; 

19) sudo nano /etc/rc.local
    ;;

20) sudo rm /etc/profile.d/myscript.sh 
    sudo ln -s /Xcod3-SniffingRouter/xcod3sniffing.sh /etc/profile.d/myscript.sh
    read -p "Tekan enter untuk restart"
    sudo systemctl reboot -i
    ;;

21) read -p "Apakah anda yakin akan restart? y/n :" -n 1 -r
    echo 
    if [[ ! $REPLY =~ ^[Nn]$ ]]
    then
    sudo systemctl reboot -i
    fi
    ;;

22) ;;
*)    echo "Maaf, menu tidak ada"
esac
echo ""
echo "Xcod3 Router"
echo "Developers : ALIF FUSOBAR - master@itsecurity.id - www.itsecurity.id"
echo ""
echo -n "Kembali ke menu? [y/n]: ";
read again;
while [[ $again != 'Y' ]] && [[ $again != 'y' ]] && [[ $again != 'N' ]] && [[ $again != 'n' ]];
do
echo "Masukkan yang anda pilih tidak ada di menu";
echo -n "Kembali ke menu? [y/n]: ";
read again;
done
done
