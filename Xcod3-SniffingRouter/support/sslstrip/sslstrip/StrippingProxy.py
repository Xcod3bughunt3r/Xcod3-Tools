

from twisted.web.http import HTTPChannel
from ClientRequest import ClientRequest

class StrippingProxy(HTTPChannel):
    '''sslstrip is, at heart, a transparent proxy server that does some unusual things.
    This is the basic proxy server class, where we get callbacks for GET and POST methods.
    We then proxy these out using HTTP or HTTPS depending on what information we have about
    the (connection, client_address) tuple in our cache.      
    '''

    requestFactory = ClientRequest
