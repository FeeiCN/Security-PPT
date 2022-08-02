% whoami donb %

The Capgras Delusion

Attacking Perception
· Impersonate any WAC device · Trick users into handing you
cryptographic secrets · Abuse automated workflows · Gain access to network(s)

Attacking Apple WAC
· Wireless Accessory Config · Way to hand off secrets from iOS to an IoT accessory · Specification under Apple NDA · But we'll describe it anyway ;-)

Step 1: Hostapd
· Take any hostapd capable WiFi adapter · Recommend TP-LINK TL-WN722N · Configure SSID with Any SSID You Like · Add a Vendor Specific Element

WiFi Vendor Elements
· WiFi Beacons are composed of Elements · Basic Type Length Value format · Each Element defines a specific WiFi AP attribute · Such as `SSID' or `Supported Speed' or `Supported
Encryption' · A Vendor Element is data Specific to a Manufacturer

Step 2: MFI Config
· iOS will mDNS for the owner of _mfi_config · Forward request over bridged network with MOOPS · Forward responses back · Allows bridging "fake" WiFi Accessory with Real one

Step 3: Hacked Accessory
· Now any hacked accessory with a MFi chip gives you keys
· MFi will delegate WiFi keys to its host device · Use MFi as your own skeleton key

Why Does This Work?

Common SE Use Cases

Common Use Cases
· Secure Boot · Attestation · Self Identification · Peer Identification

Secure Boot

Attestation

Identification

Why MFi Fails

It's Obvious Now
· External Chip Model is critically flawed · An External SE can only identify itself · Without proper provisioning/personalization it cannot
identify its Host Device · Even with proper P&P the host device is vulnerable
without an Internal SE · Even with an internal SE, there are still gaps!

Summary

Slide 25: Kirstin, Miette, & Ruby Slide 30, 52: Elena Helfrecht Slide 48, 51: Adrian Kozakiewicz
donb@securitymouse.com

