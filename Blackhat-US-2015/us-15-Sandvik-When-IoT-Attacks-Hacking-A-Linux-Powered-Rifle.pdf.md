When IoT Attacks:
Hacking A Linux-Powered Rifle

Who are we?
· Runa A. Sandvik · Michael Auger

Why are we doing this?
· A gun with WiFi and fancy electronics... duh

Physical

Mobile Apps

TrackingPoint App

ShotView App

Public API

Initial Findings
· SSID contains the serial number, can't be changed · WPA2 key can't be changed · VLC or anything can stream the scope view · Advanced mode lock is only a 4 digit pin and can
be brute forced · API is un-authenticated · API settings can be modified regardless of
advanced mode lock

Courtesy of TrackingPoint's Website

Courtesy of TrackingPoint's Website

Tearing it open

Courtesy of TrackingPoint's YouTube

Close Up

UART

Woot!

Well played TrackingPoint...

...well played

TrackingPoint wins!
· Validating API input · GPG signed and encrypted updates · Password Protected Console

Let's get destructive!

The Real Filesystem

Had only we known!

Admin API

Demo: Got root?

Demo: You missed!

Findings
· Admin API is un-authenticated · Un-authenticated access to core system
functions · Any GPG key in trust DB can encrypt and sign
updates

Takeaways
· Small attack surface and a lot was done right:
­ USB ports are disabled during boot ­ Media is deleted from scope once downloaded ­ WPA2 is in use, even if the key cannot be changed ­ API settings are validated on the backend ­ Password protected console and single user mode ­ GPG signed and encrypted software updates

Thanks!
· Travis Goodspeed · Babak Javadi -- The CORE Group · Mickey Shkatov -- Intel Advanced Threat
Research · Joe FitzPatrick · Jesse · Kenny · ^H -- Portland's Hackerspace

