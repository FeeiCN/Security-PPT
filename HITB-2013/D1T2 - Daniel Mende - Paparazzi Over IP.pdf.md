Paparazzi over IP
Daniel Mende dmende@ernw.de

www.ernw.de

Who we are

¬ Old-school network geeks, working as security researchers for Germany based ERNW GmbH
 Independent  Deep technical knowledge  Structured (assessment) approach  Business reasonable recommendations  We understand corporate
¬ Blog: www.insinuator.net
¬ Conference: www.troopers.de

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#2 www.ernw.de

Agenda

¬ Intro

¬ Transport Protocols

¬ Communication Modes & Attacks

¬ Conclusions

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#3 www.ernw.de

Intro

¬ A number of current high-end cameras have network interfaces.

¬ We did some research as for their security and potential attack paths.

¬ In the following we focus on Canons

new flagship EOS 1D X, but similar

problems might be found in other

models, of other vendors, too.

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#4 www.ernw.de

The Camera
Canon EOS-1D X
4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#5 www.ernw.de

The Camera
A Bit of Marketing

¬ From Canon USA:
 A built in Ethernet port allows for fast, easy transfer of images directly to a PC or via a network to clients from live events.
 The EOS-1D X is compatible with the new WFT-E6A Wireless File Transmitter for wireless LAN transfer with the IEEE 802.11 a/b/g/n standards.

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#6 www.ernw.de

The Camera
The Ethernet Port
4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#7 www.ernw.de

The Camera
WLAN Adapter
4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#8 www.ernw.de

The Target
aka. Mr. Reuters
4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#9 www.ernw.de

The Target
What if

¬ One could get the real, unedited images first.
¬ One could upload (bad) images.
¬ One could turn the camera into a surveillance device.

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#10 www.ernw.de

Transport
The underlying Protocols

www.ernw.de

Transport

¬ Wired LAN via built-in Ethernet port or Wireless LAN via WFT-E6A.
¬ Standard TCP/IP (no IPv6, yet).

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#12 www.ernw.de

Traditional Attacks
Layer 2

¬ ARP-spoofing possible.
 No "sticky" ARP entries
¬ ARP-flooding with ~100 packets per second DoS the network stack.

¬ Btw. stack also dies if IPv6 (multicast) is present.

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#13 www.ernw.de

Traditional Attacks
Layer 3/4

¬ TCP/IP is used for all network communication.
¬ Established connections can be killed via TCP-RST.

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#14 www.ernw.de

Communication Modes

www.ernw.de

Communication Modes
Overview

¬ FTP Upload Mode ¬ DLNA ¬ Built-in webserver ¬ EOS Utility

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#16 www.ernw.de

FTP Upload Mode

www.ernw.de

FTP Upload Mode
Mode of operation

¬ Target server and credentials configured on camera.
¬ Photos taken are uploaded to the server immediately.

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#18 www.ernw.de

FTP Upload Mode
Downside

¬ As FTP is clear text, credentials can be sniffed.
¬ As well as the complete data transmission
¬ Uploaded pictures can be extracted from network traffic.

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#19 www.ernw.de

FTP Upload Mode

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#20 www.ernw.de

FTP Upload Mode

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#21 www.ernw.de

DLNA mode

www.ernw.de

DLNA mode
Overview

¬ Digital Living Network Alliance®
¬ UPnP used for discovery. ¬ DLNA guidelines for file formats,
encodings, resolutions.
¬ HTTP and XML used to access media.

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#23 www.ernw.de

DLNA mode
Cons

¬ No authentication. ¬ No restrictions.
¬ Every DLNA client can download _all_ images.
¬ Your Browser could be a DLNA client. Or somebody else's browser. For your camera.

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#24 www.ernw.de

Built-in webserver
Always a good idea...

www.ernw.de

Built-in webserver
Canon WFT Server

¬ Wireless File Transmitter Server Mode.
¬ Canon USA: "Use a web browser to capture, view and download images remotely"

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#26 www.ernw.de

Built-in webserver
Canon WFT Server

¬ Browser interface uses AJAX.
¬ Embedded webserver only capable of HTTP GET method.
 Every other request method is answered with a 404.

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#27 www.ernw.de

Built-in webserver
Authentication

¬ Authentication via HTTP Basic (RFC 2617) on login page.
¬ Session cookie is used afterwards.
¬ Cookie looks like sessionID=40b1
 4 (!!!) byte Session ID
 65535 possible IDs

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#28 www.ernw.de

Built-in webserver

¬ Session ID Brute force implemented in 6 lines of python.
¬ To check for all possible IDs takes about 20 minutes.
 Embedded Webserver is not that responsive.

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#29 www.ernw.de

import requests
target_uri = 'http://192.168.1.103/api/cam/lvoutput' target_string = 'SESSION_ERR'
for i in xrange(0xffff): if (i != 0 and i%1000 == 0): print str(i) + 'IDs checked' r = requests.get(target_uri, cookies={'sessionID': '%x' %i}) if r.text.find(target_string) == -1: print 'SessionID is : sessionID=%x' %i break

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#30 www.ernw.de

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#31 www.ernw.de

Built-in webserver
recap

¬ Full access to Live View, stored photos and camera settings.
¬ You surf ­ We brute.

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#32 www.ernw.de

Built-in webserver
Requirements

¬ Camera in WFT Server mode. ¬ Valid session opened by user. ¬ Some minutes of time.

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#33 www.ernw.de

EOS Utility mode
aka. I wanna be root

www.ernw.de

EOS Utility mode
The Utility

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#35 www.ernw.de

EOS Utility mode
The Utility

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#36 www.ernw.de

EOS Utility mode
Overview

¬ Allows remote control of all nonmanual camera functions.
¬ Pictures can be up- and downloaded.
¬ Possibly even more (sound recording anyone?)

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#37 www.ernw.de

EOS Utility mode
Technical

¬ SSDP and MDNS used for discovery.
¬ PTP/IP used for communication.
¬ Needs initial camera <-> software pairing.

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#38 www.ernw.de

EOS Utility mode
Pairing

¬ At first use, credentials needs to be exchanged between the camera and the client software.

¬ Camera must be put into pairing mode via camera menu.
¬ Camera signals the need for pairing via MDNS.

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#39 www.ernw.de

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#40 www.ernw.de

EOS Utility mode
Pairing

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#41 www.ernw.de

EOS Utility mode
Pairing

¬ Client software connects to camera via PTP/IP.
¬ PTP/IP Authentication is successful regardless of the credentials.
¬ Credentials (hostname, GUID) are stored on the camera.

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#42 www.ernw.de

PTP/IP
Feels like USBoIP )-:

www.ernw.de

PTP/IP

¬ Picture Transfer Protocol over Internet Protocol.
¬ ISO 15740. ¬ Standardized by International
Imaging Industry Association

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#44 www.ernw.de

PTP/IP
Packet format

¬ Wrapper for PTP with header:
4 byte length (little endian) 4 byte type (little endian) data

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#45 www.ernw.de

PTP/IP
Layering

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#46 www.ernw.de

PTP/IP
Authentication

¬ PTPIP_INIT_COMMAND_REQUEST
 Includes authentication data: 16 byte GUID hostname string

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#47 www.ernw.de

PTPIP_INIT_COMMAND_REQUEST

2a 00 00 00 01 00 00 00 a3 e0 fc 96 ef 59 79 42 65 00 72 00 00 00 00 00

eb 7a 78 9d 69 cb 64 4e 73 00 65 00 72 00 76 00 01 00

Paket length = 42 byte Paket type = 0x01 = PTPIP_INIT_COMMAND_REQUEST GUID Hostname = "server" @ utf16 Trailer

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#48 www.ernw.de

PTP

www.ernw.de

PTP
Explained

¬ Picture Transfer Protocol
¬ Standardized by International Imaging Industry Association
¬ ISO 15740 ¬ Lots of proprietary vendor
extensions.

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#50 www.ernw.de

PTP
Packet format

¬ Designed for use over USB ¬ Fixed length
¬ 2 byte Msg Code ¬ 4 byte Session ID ¬ 4 byte Transaction ID ¬ 5 times 4 byte Parameter or Data

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#51 www.ernw.de

PTP
Message Codes

¬ Lot of standardized codes like:
 PTP_GetDeviceInfo  PTP_OpenSession  PTP_CloseSession  PTP_GetStorageIDs
¬ Also Vendor specific codes like:
 PTP_CANON_GetCustomizeSpec  PTP_CANON_GetCustomizeItemInfo

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#52 www.ernw.de

PTP
Use of

¬ Thankfully there are some

implementations around.

¬ We decided to go with libgphoto2.
¬ Basic PTP/IP support is included as well.

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#53 www.ernw.de

The Attack
aka. gottcha

www.ernw.de

Attack
Getting the Credentials

¬ Client Hostname easy discoverable, but not needed.
 Camera also excepts connections with a different hostname.
¬ GUID unknown to client software. ¬ Obfuscated GUID is broadcasted by
the cam via UPNP.

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#55 www.ernw.de

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#56 www.ernw.de

tmp = mdns_info.getProperties()['tid.canon.com'].split('-') guid = [] l = lambda s: [ s[i:i+2:] for i in xrange(0,len(s),2) ][::-1] for i in xrange(0,3):
guid += l(tmp[i]) guid += tmp[3] guid += tmp[4] guid = "".join(guid)
guid = eb7a789d69cb644ea3e0fc96ef597942

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#57 www.ernw.de

The Attack
Connecting to the Camera

¬ Camera only allows one connection.
¬ Already connected client needs to be disconnected.
¬ TCP-RST the established PTP/IP connection.

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#58 www.ernw.de

Attack
Process

¬ Listen for the Cam on MDNS. ¬ De-obfuscate Authentication data. ¬ Disconnect connected Client
Software. ¬ Connect via PTP/IP.
¬ Have Phun (-;

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#59 www.ernw.de

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#60 www.ernw.de

Attack outlined
So you can write it down

¬ Photograph uses hotel / Starbucks WLAN, which isn't unlikely during events (think of Grammy Awards few days ago).

¬ Almost anybody in the same LAN can download the images from the camera (and even more).

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#61 www.ernw.de

Countermeasures

¬ Enable network functionality only in trusted Networks.
¬ Use WPA and a secure passphrase for (your trusted) WLAN.

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#62 www.ernw.de

Conclusions

¬ High-end cameras are yet another daily life item equipped with networking capabilities incl. full-blown IP stacks.

¬ Once more, their device-specific network technologies have been designed and implemented without (too much) security in mind.

¬ Again, this leads to (classes of) attacks previously unknown to their nonnetworked counterparts.

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#63 www.ernw.de

Next Steps

New series of DSLRs (EOS 6D)
 Built-in Wireless Access Point  New communication protocol for
IOS/Android App
New series of camcorder(XA20, XA25)

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#64 www.ernw.de

There's never enough time...

THANK YOU...

...for yours!

4/9/2013 © ERNW GmbH | Carl-Bosch-Str. 4 | DE-69115 Heidelberg

#65 www.ernw.de

Questions?
© ERNW GmbH | Breslauer Str.
28 | D-69124 66

www.ernw.de

