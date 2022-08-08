#!/usr/bin/env python

"""
ALIF FUSOBAR
master@itsecurity.id
www.itsecurity.id
"""

import whois
from colorama import Fore, Back, Style

def whois(host):
    
    try:
        print(f'Host: {host}')
        whois_info = whois.whois(host)
    except Exception as e:
        print(f'[!] Error: {e}')
    else:
        print(f'[{Fore.GREEN}+{Style.RESET_ALL}] Domain name')
        whois_checker(host, whois_info.domain_name)
        print(f'[{Fore.GREEN}+{Style.RESET_ALL}] Registar: {whois_info.registrar}')
        print(f'[{Fore.GREEN}+{Style.RESET_ALL}] WHOIS server: {whois_info.whois_server}')
        print(f'[{Fore.GREEN}+{Style.RESET_ALL}] Name servers')
        whois_checker(host, whois_info.name_servers)
        print(f'[{Fore.GREEN}+{Style.RESET_ALL}] Creation date')
        whois_checker(host, whois_info.creation_date)
        print(f'[{Fore.GREEN}+{Style.RESET_ALL}] Updated date')
        whois_checker(host, whois_info.updated_date)
        print(f'[{Fore.GREEN}+{Style.RESET_ALL}] Expiration date')
        whois_checker(host, whois_info.expiration_date)
        print(f'[{Fore.GREEN}+{Style.RESET_ALL}] Emails')
        whois_checker(host, whois_info.emails)
        print(f'[{Fore.GREEN}+{Style.RESET_ALL}] Organization: {whois_info.org}')


        #print(f'\n{Fore.YELLOW}{whois_info}{Style.RESET_ALL}')

def whois_checker(host, dictionary):

    whois_info = whois.whois(host)
    dict_list = {
        'whois_info.domain_name': 'Domain name', 
        'whois_info.registrar': 'Registar', 
        'whois_info.whois_server': 'WHOIS server', 
        'whois_info.name_servers': 'Name server', 
        'whois_info.creation_date': 'Creation date', 
        'whois_info.updated_date': 'Updated date', 
        'whois_info.expiration_date': 'Expiration date', 
        'whois_info.emails': 'Emails', 
        'whois_info.org': 'Organization'
        }

    try:
        length = len(dictionary)
    except:
        print(f'{dictionary}')
    else: 
        for value in dictionary:
            print(f'{Fore.GREEN}\t{value}{Style.RESET_ALL}')

if __name__ == '__main__':
    whois('google.com')