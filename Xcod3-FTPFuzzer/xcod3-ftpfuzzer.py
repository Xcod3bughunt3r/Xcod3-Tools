#!/usr/bin/python
import socket
import sys
 
if len(sys.argv) != 6:
    print "Xcod3 FTP Fuzzer" 
    print "Oleh ALIF FUSOBAR - master@itsecurity.id - www.itsecurity.id"
    print "Cara penggunaan : python xcod3-ftpfuzzer.py <ip target> <port> <karakter> <jumlah karakter> <command ftp>"
    sys.exit(1)
 
ipaddress = sys.argv[1]
port = int(sys.argv[2])
karakter = sys.argv[3]
paket = int(sys.argv[4])
command = sys.argv[5]
buffer = (karakter) * (paket)

try:
 print "  -----------------------"
 print "  Xcod3 FTP Fuzzer"
 print "  Oleh ALIF FUSOBAR"
 print "  master@itsecurity.id"
 print "  www.itsecurity.id"
 print "  -----------------------"
 print "" 
 s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
 s.connect((str(ipaddress),(port)))
 print "  Kirim paket"
 s.send("(command) "+buffer+"\r\n")
 print s.recv(1024)
 s.close()

except:
  print "  Tidak dapat terkoneksi ke FTP Server"
