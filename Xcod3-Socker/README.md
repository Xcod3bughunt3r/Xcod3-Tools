<p align="left"><a href="https://www.itsecurity.id/"><img height="150" title="Xcod3bughunt3r" src="0011.png"/></a></p>

# ***SOCKER***
#### ``Checks for valid SOCKS4 & SOCKS5 proxies. This code is Python3 port of`` *[SOCKS-Proxy-Checker](https://github.com/BeastsMC/SOCKS-Proxy-Checker/)* ``which was written in Python2 This code runs on python3.``

#### ``Command Line Usage:``
```
python3 checking.py -i <proxy_file_list> -o <file_to_write> -th <threads> -t <timeout>
```

```
python3 checking.py -i socks4.txt -o socks44.txt -th 10 -t 5/10
```

#### ``You can use the auto mode for fetching proxies from default APIs.``
```
python3 checking.py -auto -o <file_to_write> -th <threads> -t <timeout>
```

#### ``You can use the URL mode to add new urls to fetch proxies.``
```
python3 checking.py -u proxlylist1.site -u proxlylist2.site -o <file_to_write> -th <threads> -t <timeout>
```

#### ***All the parameters are optional.***
#### ``File, Auto, URL modes can be used simulaenously to gather more proxies. The default thread count is 30 and timeout is 5 seconds.``
#### ***SOME TERMS:***
#### ``Proxy list - An absolute path to the file containing a list of proxies in the of IP:Port. Output file - An absolute path to the file that the live SOCKS4/5 proxies will be written to. Threads - The number of threads that will be used to check proxies. More threads = quicker scanning. If the thread count is too high, your internet connection may be interrupted and false timeouts/connection refused errors will be printed. Timeout - The amount of time to give a potential proxy to repond before giving up and trying the next. This script attempts to verify if a given IP:Port listing is a SOCKS4/5 proxy by completeing a SOCKS4/5 handshake with it. In order to maintain the highest level of compatibility I could, I did not use third party libraries and stuck with the default Python libraries.``

# ***SOCKSLIST***
#### ``You can Also Use My PROXY List to get New SOCKS Proxy. It Gets Updated Every 24 hours.``
###### [Proxy List Link :](https://github.com/Xcod3bughunt3r/Proxy-List)

### ``DEVELOPERS:``*[Xcod3bughunt3r](https://github.com/Xcod3bughunt3r/Xcod3bughunt3r)*.
