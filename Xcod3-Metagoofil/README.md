<p align="left"><a href="https://www.itsecurity.id/"><img height="150" title="Xcod3bughunt3r" src="0011.png"/></a></p>

# ``Xcod3 Metagoofil``
### ``Simple OSINT Tools``
### ``Google is blocking me!``
##### ``If you start getting HTTP 429 errors, Google has rightfully detected you as a bot and will block your IP for a set period of time.  One solution is to use proxychains and a bank of proxies to round robin the lookups.``

##### ``Install proxychains4 / proxychains``
```bash
apt install proxychains4 -y
```

##### ``Edit the`` `/etc/proxychains4.conf` ``configuration file to round robin the look ups through different proxy servers. In the example below, 2 different dynamic SOCKS proxies have been set up with different local listening ports (9050 and 9051).  Don't know how to utilize SSH and dynamic SOCKS proxies?  Do yourself a favor and pick up a copy of`` [Cyber Plumber's Handbook and interactive lab](https://gumroad.com/l/cph_book_and_lab) ``to learn all about Secure Shell (SSH) tunneling, port redirection, and bending traffic like a boss.``

```bash
vim /etc/proxychains4.conf

round_robin
chain_len = 1
proxy_dns
remote_dns_subnet 224
tcp_read_time_out 15000
tcp_connect_time_out 8000
[ProxyList]
socks4 127.0.0.1 9050
socks5 127.0.0.1 9051
```

##### ``Throw `proxychains4` in front of the Python script and each lookup will go through a different proxy (and thus source from a different IP).  You could even tune down the `-e` delay time because you will be leveraging different proxy boxes.``

```
proxychains4 python metagoofil.py -d https://github.com -f -t pdf,doc,xls
```

###### OR

```
python metagoofil.py -d website.com -f -t pdf,doc,xls,pptx,md,txt
```

### ``DEVELOPERS:``*[Xcod3bughunt3r](https://github.com/Xcod3bughunt3r/Xcod3bughunt3r)*.
