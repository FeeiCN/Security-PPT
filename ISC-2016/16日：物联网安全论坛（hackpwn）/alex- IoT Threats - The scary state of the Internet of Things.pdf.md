IoT Threats The scary state of the Internet of Things

Alex

"Jay"

Balan

Bitdefender Chief Security

Researcher

Radu Basaraba

Bitdefender Senior IoT Security Researcher

SMART EVERYTHING

Smart lightbulb & WiFi repeater

Smart Portable fish finder

Smart Lightbulb

Smart Thermostat Smart Barbie doll

Smart Yoga Mat Smart Power Outlet

Smart Music Player Smart Coffee Maker

IOT HACKING - TOOLS OF THE TRADE

· Mobile App debugging · Network tools (nmap, wireshark, slssplit, etc) · Evil Twin attacks · UART (Universal Asynchronous Receive & Transmit) · JTAG (Joint Test Action Group) ­ HW Debug · SPI (Serial Peripheral Interface) · I2C (Inter-Integrated Circuit)

GOALS: · Access file system · Dump memory · Hijack boot loader · See network traffic

· Vendor BackdoorsManagement interface · Firmware / File system exposure yields
ways of hacking the device in most cases

THE MOST COMMON ISSUES
· Default passwords. Undocumented. · Weak or no encryption when talking outside the network
enabling remote takeover · Command injection in some of the device's
unauthenticated interactions · Very old (as old as 2008 or even older) services (dns, ssh,
webserver, etc) with all the vulnerabilities that come with them. We identified a cumulated number of 300 (!!!) vulnerabilities for a single device simply because each service had an average of 70-100 vulnerabilities identified to date (from DoS to LFI, RCE. You get the idea) · WiFi configuration hotspots that either remain open once setup is finished or can be started easily · Firmware updates are available but they are still very non-intuitive in many devices and users don't apply them.

IMPACT
· It's much more difficult to stop attacks on "things" than traditional laptops and smartphones. If an attacker decides to start playing with a home's smart lights most people will be powerless to do anything about it bar shutting down the power entirely
· In a lot of scenarios, the devices will leak the WiFi password. In some, they will leak even more sensitive information
· Many devices run busybox and can be used to "pivot" or sniff sensitive data in the local network.
· We've already seen rootkits designed especially for ARM architectures and busybox placing the devices into botnets.
· In 2014 100.000 refrigerators were incorporated into a botnet that was able to send 750.000 spam e-mails in bursts of 100.000 emails at a time, three times a day.

EXAMPLES
SMART POWER OUTLET SMART DOORBELL

SMART POWER OUTLET
· Popular device from a reputable vendor · Weak encryption when talking to the internet · Leaks sensitive information via weak encrypted
channels · If the user configures e-mail notifications, the e-
mail credentials will be leaked as well · Undocumented default credentials enable
attackers to remotely control all power outlets that didn't change the default passwords · Remote command injection provides a connect back shell and full remote control of the device at the OS level.

SMART POWER OUTLET
DEMO

SMART DOORBELL

· Step 1 : nmap & wireshark

Telnet ? Too bad we don't have credentials

SMART DOORBELL
· Step 2 : study the management apk
;RCE

SMART DOORBELL
DEMO #1

SMART DOORBELL
HACKING IS HARD. WHY NOT DO IT THE EASY WAY ?

SMART DOORBELL
DEMO #2

FINAL NOTES
· Pentest your everything · Additionally, keep in mind a few key items:
· Always use proper encryption on all communication channels · Don't let the configuration AP on after the setup is finished · If you need to provide telnet access to the device enforce a
password change · For that matter enforce a password change everywhere where
applicable · Remember that users simply love the comfort provided by your
appliance and that is the only thing they care about. · Mass scanners & exploiting tools for IoT are already here. · The ratio of vulnerable devices is alarmingly high.

THANKS

