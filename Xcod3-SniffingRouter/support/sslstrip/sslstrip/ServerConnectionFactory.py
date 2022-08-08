

import logging
from twisted.internet.protocol import ClientFactory

class ServerConnectionFactory(ClientFactory):

    def __init__(self, command, uri, postData, headers, client):
        self.command      = command
        self.uri          = uri
        self.postData     = postData
        self.headers      = headers
        self.client       = client

    def buildProtocol(self, addr):
        return self.protocol(self.command, self.uri, self.postData, self.headers, self.client)
    
    def clientConnectionFailed(self, connector, reason):
        logging.debug("Server connection failed.")

        destination = connector.getDestination()

        if (destination.port != 443):
            logging.debug("Retrying via SSL")
            self.client.proxyViaSSL(self.headers['host'], self.command, self.uri, self.postData, self.headers, 443)
        else:
            self.client.finish()

