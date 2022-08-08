#!/usr/bin/env python
from socket import * 

if __name__ == '__main__':
   print "Xcod3 - Port Fuzzer Scanner" 
   print "Developers : ALIF FUSOBAR - Xcod3bughunt3r"
   print "master@itsecurity.id - www.itsecurity.id - sachihenakyy@gmail.com"
   cek = raw_input('Masukkan target : ')
   karakter = raw_input('Masukkan karakter : ')
   paket = int(raw_input('Jumlah karakter yang dikirim : '))
   cekip = gethostbyname(cek)
   buffer = (karakter) * (paket)
   print 'Pengiriman paket pada target :', cekip
   for i in range(20, 65536):
      s = socket(AF_INET, SOCK_STREAM)
      hasil = s.connect_ex((cekip, i))
      if(hasil == 0) :
          if (i == 21) :
             command = raw_input('Ada FTP Terdeteksi, COMMAND FTP yang ingin difuzzing? : ')
             s.send("(command) "+buffer+"\r\n")
             print s.recv(1024) 
	  print 'Port %d: dikirim paket' % (i,)
          s.send(buffer)
      s.close()

