<p align="left"><a href="https://www.itsecurity.id/"><img height="150" title="Xcod3bughunt3r" src="0011.png"/></a></p>

# ``AFXcod3``

[![made-with-python](https://img.shields.io/badge/Made%20with-Python-1f425f.svg)](https://www.python.org/) | [![Linux](https://svgshare.com/i/Zhy.svg)](https://www.linuxfoundation.org/) | [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## ````AFXcod3 adalah Alat jaringan dan utilitas bertahan yang saya kembangkan sehingga saya dapat melakukan berbagai jenis tugas menggunakan suite yang sama, alih-alih melompat dari satu alat ke alat lain.````

#### ````Saat ini, skrip ini dapat melakukan berbagai tugas seperti ifconfig, ping, traceroute, port scans (Including SYN, TCP, UDP, ACK, Comprehensive Scan, Host Discovery (scan for up devices on a local network), MAC address detection (get MAC address of a host IP on a local network), banner grabbing, DNS checks (with geolocation information), WHOIS, Subdomain Enumeration, Vulnerability Reconnaissance, Packet Sniffing, MAC Spoofing, IP Spoofing, SYN Flooding, Deauth Attack and Brute-Force Attack (beta).````

#### ````Fitur lain masih diimplementasikan. Implementasi di masa depan dapat mencakup deteksi WAF, Enumerasi DNS, Analisis lalu lintas, Pemindai Kerentanan XSS, Keracunan Cache ARP, Keracunan Cache DNS, Banjir MAC, Ping of Death, Serangan Disassociation Jaringan (bukan serangan deauth), OSINT, Email Spoofing, Exploits, Dan Juga Beberapa Tugas Otomatis & Lainnya.````

## ``Contents :``
+ [Installation](#installation)
  - [Linux](#linux)
+ [Configuration](#configuration)
+ [How to use](#how-to-use)
  + Networking
    - [ifconfig (beta)](#ifconfig)
    - [ping](#ping)
    - [traceroute](#traceroute)
  + Footprinting
    - [Port scans](#port-scans)
    - [Host discovery (scan for devices on a local network)](#host-discovery)
    - [MAC address detection (get MAC address of a host IP on a local network)](#mac-address-detection)
    - [Banner grabbing](#banner-grabbing)
    - [DNS checks (with geolocation information)](#dns-checks)
    - [WHOIS](#whois)
    - [Subdomain enumeration](#subdomain-enumeration)
    - [Directory busting](#directory-busting)
    - [Vulnerability reconnaissance](#vulnerability-reconnaissance)
  + Offensive
    - [Packet sniffing](#packet-sniffing)
    - [MAC spoofing](#mac-spoofing)
    - [IP spoofing](#ip-spoofing)
    - [SYN flooding](#syn-flooding)
    - [Deauth attack](#deauth-attack)
    - [Brute-force attack (beta)](#brute-force-attack)
  + Others
    - [Automated reconnaissance (beta)](#automated-reconnaissance)
+ [Developers](#developers)

****

## Installation
#### ````Perhatikan bahwa saat ini, skrip ini hanya berjalan dengan baik di Linux. Jika Anda mencobanya di Windows atau MacOS, itu dapat berjalan, tetapi banyak kesalahan akan muncul.````
#### ````Script ini diuji pada:````
- Kali Linux
- Ubuntu
- Pop!_OS
- BlackArch

## Linux
#### ````Untuk menginstal paket yang diperlukan sehingga script dapat berjalan dengan masalah apa pun hanya menjalankan skrip `setup.sh` dengan hak istimewa. Saat ini, skrip instalasi ini hanya didukung pada Debian, Red Hat, dan distro berbasis lengkungan yang memiliki Manajer Paket Apt, DNF dan Pacman (Ubuntu, Kali Linux, Parrot OS, Debian, Pop!_OS, Linux Mint, Deepin, Zorin OS, MX Linux, Elementary OS, Fedora, CentOS, Red Hat Enterprise Linux, Rocky Linux, AlmaLinux, Oracle Linux, ClearOS, Arch, Black Arch, Manjaro, etc). Pada sebagian besar sistem, untuk menginstal AFXCOD3 cukup jalankan perintah berikut:````

```
git clone --depth=1 https://github.com/Xcod3bughunt3r/AFXcod3.git
cd AFXcod3/ && chmod +x *
sudo sh setup.sh
```

#### ````Kemudian, cukup ikuti instruksi. Namun, jika Anda menggunakan distro Linux lainnya dengan manajer paket yang berbeda, silakan instal paket secara manual menggunakan manajer paket distro Anda. Tergantung pada distro spesifik yang digunakan, beberapa paket yang diperlukan untuk menjalankan skrip ini mungkin sudah diinstal pada mesin Anda. Jika Anda ingin mengetahui paket yang diperlukan, lihat file `setup.sh`.````
#### ````Setelah instalasi, untuk menjalankan program, cukup navigasikan ke direktori proyek dan jalankan file `afxcod3.py` menggunakan Python. Menjalankan skrip sebagai root direkomendasikan untuk kinerja yang lebih baik dan untuk menghindari kesalahan izin. Perintah bekas adalah sebagai berikut:.````

```
sudo python3 afxcod3.py
```

****

## Configuration
#### ````Untuk membuat konfigurasi, cukup buka file konfigurasi di `files/conf.py` dan edit.````

****

## How to use
## ifconfig
#### ````Jika Anda ingin menampilkan konfigurasi jaringan TCP / IP sistem Anda saat ini, ketikkan perintah berikut:````

``-ifconfig``

## ping
#### ````Untuk mengirim paket ICMP ke satu atau lebih host untuk memeriksa konektivitas, cukup ketik:````

``-ping <HOST(s) IP/URL>``

## traceroute
#### ````Untuk mendiagnosis jalur rute dan mengukur penundaan transit, gunakan perintah `-traceroute`:````

``-traceroute <HOST IP/URL>``

****

## Port scans
#### ````Port pemindaian membantu mendeteksi potensi pelanggaran keamanan dengan mengidentifikasi host yang terhubung ke jaringan Anda dan layanan yang berjalan.````
#### ````Beberapa jenis pemindaian didukung, termasuk SYN (`-scansyn`), TCP (`-scantcp`), UDP (`-scanudp`), ACK (`-scanack`) dan pemindaian komprehensif (`-scan`).````
``-scan -host <HOST(s) IP/URL>``

``-scan -host <HOST(s) IP/URL> -p <PORT(s)>``

#### ````Jika Anda ingin memindai rentang IP dan/atau rentang port, gunakan salah satu dari perintah berikut:````
``-scan -host <HOST(s) IP/URL> -prange <START PORT> <END PORT>``

``-scan -iprange <START IP> <END IP> -p <PORT(s)>``

``-scan -iprange <START IP> <END IP> -prange <START PORT> <END PORT>``

#### ````Setelah pemindaian ini, ada kemungkinan untuk melihat bahwa port 22 (SSH) dan 80 (http) terbuka.````

## Host discovery
#### ````Untuk mencari perangkat saat ini pada jenis jaringan yang diberikan perintah berikut:````
``-scanlan``

#### ````Kemudian ketik jaringan yang ingin Anda pindai.````

## MAC address detection
#### ````Untuk mendapatkan alamat MAC dari satu atau lebih host langsung pada LAN, gunakan perintah:````
``-getmac -host <HOST(s) IP>``

## Banner grabbing
#### ````Banner Grabbing adalah teknik pengintaian yang mengambil informasi spanduk perangkat lunak. Spanduk ini biasanya berisi informasi penting tentang layanan jaringan, termasuk tetapi tidak terbatas pada, itu nama perangkat lunak dan versi. FTP, Web, SSH, Dan server SMTP sering mengekspos informasi penting tentang perangkat lunak yang mereka jalankan dalam spanduk mereka. Serangan banner biasanya dimulai dengan pemindaian enumerasi untuk menemukan port terbuka. Setelah Anda mengidentifikasi layanan yang ingin Anda targetkan, Anda dapat mengirim paket tertentu dan memeriksa lalu lintas untuk informasi yang ditentukan.````

#### ````Untuk melakukan perampasan spanduk, tergantung pada kebutuhan spesifik Anda, ketikkan salah satu dari perintah berikut:````
``-grab -host <HOST(s) IP/URL> -p <PORT(s)>``

``-grab -iprange <START IP> <END IP> -prange <START PORT> <END PORT>``

``-grab -host <HOST(s) IP/URL> -prange <START PORT> <END PORT>``

``-grab -iprange <START IP> <END IP> -p <PORT(s)>``

## DNS checks
##### ````Fitur ini mirip dengan perintah `nslookup` terkenal yang digunakan pada sistem Unix. Jika Anda ingin melakukan pemeriksaan DNS, ketikkan yang berikut ini:````
``-ns <HOST(s) IP/URL>``

#### ````Disclaimer: Perhatikan bahwa fitur ini menggunakan ipinfo API. Disarankan untuk mengubah kunci API ke Anda karena kunci yang disediakan mungkin digunakan oleh orang lain. Untuk mengubah tombol API buka file konfigurasi pada `file/conf.py`.````

## WHOIS
#### ````WHOIS adalah protokol TCP yang bertujuan untuk berkonsultasi dengan kontak dan DNS. Untuk meminta whois dari satu halaman atau lebih, ketik saja:````
``-whois <HOST(s) IP/URL>``

## Subdomain enumeration
#### ````Enumerasi subdomain adalah proses menemukan sub-domain yang valid untuk satu atau lebih domain. Enumerasi sub-domain dapat mengungkapkan banyak domain/sub-domain yang berada dalam ruang lingkup penilaian keamanan yang pada gilirannya meningkatkan peluang menemukan kerentanan. Jika Anda ingin mencari subdomain umum dari domain, cukup ketik:````
``-sdenum <DOMAIN>``

#### ````Perintah ini menggunakan daftar kata default untuk mencari subdomain. Namun, jika Anda ingin menggunakan daftar kata Anda sendiri, ketik:````
``-sdenum <DOMAIN> -wordlist <WORDLIST PATH>``

## Directory busting
#### ````Direktori Busting adalah proses menemukan direktori dalam server web. Untuk melakukan jenis tugas ini:````
``-dirbust <HOST IP/URL>``

#### ````Perintah ini menggunakan daftar kata default untuk mencari subdomain. Namun, jika Anda ingin menggunakan daftar kata Anda sendiri, ketik:````
``-dirbust <HOST IP/URL> -wordlist <WORDLIST PATH>``

## Vulnerability reconnaissance
#### ````Untuk memindai satu atau lebih host untuk kerentanan, gunakan perintah berikut:````
``-vulnscan -host <HOST(s) IP/URL>``

#### ````Disclaimer: Perhatikan bahwa fitur ini menggunakan Shodan API. Disarankan untuk mengubah kunci API ke Anda karena kunci yang disediakan mungkin digunakan oleh orang lain. Untuk mengubah kunci API pergi ke file konfigurasi di `files/conf.py`.````

****

## Packet sniffing
#### ````Untuk melakukan mengendus paket, ketik:````
``-sniff``

#### ````Disclaimer: Jika Anda ingin mengendus semua data yang melewati jaringan, pertama-tama putar kartu nirkabel atau adaptor untuk "Monitor Mode".````

## MAC spoofing
#### ````Mac Spoofing adalah generasi frame dengan alamat MAC yang berbeda dari alamat NIC pengiriman. Untuk mengubah alamat MAC antarmuka, mengeluarkan perintah:````
``-macspoof -source <SOURCE MAC> -iface <INTERFACE>``

#### ````Seperti yang dapat Anda lihat di tangkapan layar di bawah ini, alamat MAC antarmuka berhasil diubah.````

## IP spoofing
#### ````Tujuan dari IP Spoofing adalah dengan memodifikasi alamat IP sumber yang benar sehingga sistem yang diarahkan paket tidak dapat mengidentifikasi pengirim dengan benar. Perhatikan bahwa perintah ini hanya berfungsi pada mesin dengan kerentanan yang tidak bingung. Untuk melakukan spoofing IP pada port spesifik host, gunakan perintah berikut:````
``-ipspoof -source <SOURCE IP> <SOURCE PORT> -target <TARGET IP/URL> <TARGET PORT>``

#### ````Jika Anda ingin menggunakan IP Sumber Acak, ketikkan perintah berikut:````
``-ipspoof -source r <SOURCE PORT> -target <TARGET IP/URL> <TARGET PORT>``

#### ````Anda juga dapat menggunakan port sumber acak:````
``-ipspoof -source <SOURCE IP> r -target <TARGET IP/URL> <TARGET PORT>``

#### ````Disclaimer: Harap hanya menggunakan ini untuk tujuan pengujian dan targetkan mesin Anda sendiri.````

## SYN flooding
#### ````Syn Flood adalah metode serangan DDoS yang menyebabkan overhead langsung dalam lapisan transport (lapisan 4) dan overhead tidak langsung dalam lapisan aplikasi (Layer 7). Untuk mencoba membanjiri sinyal, ketik:````
``-synflood -source <SOURCE PORT> -target <TARGET IP/URL> <TARGET PORT>``

#### ````Jika Anda ingin menggunakan port sumber acak, ketikkan perintah berikut:````
``-synflood -source r -target <TARGET IP/URL> <TARGET PORT>``

#### ````Disclaimer: Harap hanya menggunakan ini untuk tujuan pengujian dan targetkan mesin Anda sendiri.````

## Deauth attack
#### ````Serangan Deauth adalah jenis serangan nirkabel yang menargetkan komunikasi antara router dan satu atau lebih perangkat yang terhubung ke router itu. Secara efektif memaksa mesin target untuk memutuskan sambungan dari titik akses.````
#### ````Untuk melakukan serangan ini, gunakan perintah berikut:````
``-deauth -target <TARGET MAC> -gateway <GATEWAY MAC> -iface <INTERFACE>``

#### ````Jika Anda berencana untuk menyerang semua klien di gateway, ketik:````
``-deauth -target a -gateway <GATEWAY MAC> -iface <INTERFACE>``

#### ````Anda juga dapat memilih antarmuka nirkabel default Anda (dikonfigurasi dalam file/conf.py`) untuk melakukan serangan:````
``-deauth -target <TARGET MAC> -gateway <GATEWAY MAC> -iface d``

#### ````Setelah perintah dikeluarkan pada tangkapan layar di atas, semua perangkat yang terhubung ke titik akses terputus dan tidak dapat terhubung kembali saat skrip ini berjalan.````
#### ````Disclaimer: Untuk melakukan serangan ini, pastikan Anda memiliki kartu nirkabel atau adaptor yang mendukung "Monitor Mode" dan nyalakan sebelum mencoba serangan Deauth. Harap hanya menggunakan ini untuk tujuan pengujian dan targetkan mesin Anda sendiri.````

## Brute-force attack
#### ````Serangan brute-force adalah upaya untuk memecahkan kata sandi atau nama pengguna. Untuk melakukan serangan brute-force dan menemukan kredensial umum/lemah, ketik:````
``-bruteforce <SERVICE> -target <TARGET IP/URL> -user <USERNAME>``

#### ````Jika Anda ingin menggunakan WordList khusus, gunakan perintah:````
``-bruteforce <SERVICE> -target <TARGET IP/URL> -user <USERNAME> -wordlist <WORDLIST PATH>``

#### ````Untuk saat ini, hanya layanan SSH yang didukung.````
#### ````Disclaimer: Perhatikan bahwa server target mungkin memiliki mekanisme pertahanan terhadap jenis serangan ini dan memblokir upaya penyerang menebak kata sandi. Harap hanya menggunakan ini untuk tujuan pengujian dan targetkan mesin Anda sendiri.````

****

## Automated Reconnaissance
#### ````Perintah ini akan mengotomatiskan beberapa teknik pengintaian yang tersedia pada skrip ini. Untuk melakukan ini, ketik:````
``-autoscan <HOST(s) IP/URL>``

### ```Nyalakan monitor atau mode yang dikelola pada antarmuka.```
#### ````Sebagian besar pengguna nirkabel hanya menggunakan kartu nirkabel mereka sebagai stasiun ke AP. Dalam mode terkelola, kartu nirkabel dan perangkat lunak driver mengandalkan AP lokal dalam mode terkelola untuk memberikan konektivitas ke jaringan nirkabel. Beberapa kartu nirkabel juga mendukung fungsionalitas mode monitor. Ketika dikonfigurasi dalam mode monitor, kartu nirkabel berhenti mentransmisikan data dan mengendus saluran yang saat ini dikonfigurasi, melaporkan konten dari setiap paket yang diamati ke sistem operasi host.````

#### ````Untuk mengubah antarmuka untuk memonitor mode, gunakan perintah berikut:````
``-mode monitor -iface <INTERFACE>``

#### ````Anda juga dapat mengatur antarmuka Anda ke antarmuka nirkabel default (configured in `files/conf.py`):````
``-mode monitor -iface d``

#### ````Namun, jika Anda ingin memutar antarmuka Anda kembali ke mode yang dikelola, ketik:````
``-mode managed -iface <INTERFACE>``

#### ````Anda juga dapat mengatur antarmuka Anda ke antarmuka nirkabel default (configured in `files/conf.py`):````
``-mode managed -iface d``

****

## Developers
#### [Xcod3bughunt3r](https://github.com/Xcod3bughunt3r/Xcod3bughunt3r) - ````Buat masalah atau tarik permintaan, atau kirimi saya email di```` [master@itsecurity.id](mailto:master@itsecurity.id) | [aku.aliffusobar@gmail.com](mailto:aku.aliffusobar@gmail.com).

