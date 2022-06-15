Trust in Apple's Secret Garden: Exploring & Reversing Apple's Continuity Protocol
Ta-Lun Yen talun_yen@trendmicro.com @evanslify
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

whoami
 From Taiwan  Independent Security Researcher
 Threat Researcher @ TXOne Networks (Trend Micro), 2019/11-present
 Focused on protocol analysis, wireless, hardware  Previously: HITCON 2018, 2019  Powerlifting
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Agenda
 Overview ­ Background ­ Continuity Protocol introduction
 Prior Studies ­ Current status of Continuity's Security
 Our attack scenario ­ Fingerprinting / Tracking / Metadata leak ­ Breaking MAC Rotation
 Demo
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Apple's unboxing experience
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Apple Continuity

Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

6

Continuity Protocol
 A proprietary protocol used by Apple's devices, based on BLE & Wi-Fi
 Integrated with iCloud (Public Key Infrastructure)  For users to move seamlessly between devices
­ Phone calls, clipboards, hotspot, camera, airdrop, messages
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Why this topic?
 Research was intended to re-implement Continuity on Linux
 Switched from Mac to Linux 2018/9
­ I missed AirDrop / Instant Hotspot ­ Hotspot has gimmicks, not working 100% of time
 Settings menu has to be open, but sometimes still fails
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Why this topic?
 Continuity protocol hasn't been discussed before  Fired up Ubertooth & PacketLogger  It's more interesting to study its security/privacy
implications
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Why this topic?
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Responsible Disclosure
 Initially reported to Apple (8/5/2019) and reviewed prior to presentation during HITCON 2019
 Resubmitted to Apple in relation to Black Hat EU presentation on 11/21/2019
 Wi-Fi - CVE-2019-8854 Impact: A device may be passively tracked by its WiFi MAC address Description: A user privacy issue was addressed by removing the broadcast MAC address.
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Related Work & References
 Garman et al. (2016) Dancing on the Lip of the Volcano: Chosen Ciphertext Attacks on Apple iMessage https://www.usenix.org/conference/usenixsecurity16/technical-sessions/presentation/garman
 Martin Vigo (2017) DIY Spy Program: Abusing Apple's Call Relay Protocol. https://www.martinvigo.com/diy-spy-program-abusing-apple-call-relay-protocol/
 Celosia & Cunche (2019) Fingerprinting Bluetooth-Low-Energy Devices Based on the Generic Attribute Profile. https://dl.acm.org/citation.cfm?id=3358617https://dl.acm.org/citation.cfm?id=3358617
 Becker et al. (2019) Tracking Anonymized Bluetooth Devices. https://content.sciendo.com/view/journals/popets/2019/3/article-p50.xml
 Stute et al. (2018) One Billion Apples' Secret Sauce: Recipe for the Apple Wireless Direct Link Ad hoc Protocol. https://arxiv.org/abs/1808.03156
 Martin et al. (2019) Handoff All Your Privacy: A Review of Apple's Bluetooth Low Energy Continuity Protocol. https://www.cmand.org/furiousmac/
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Related Work & References
 Disclaimer
­ This research was done prior to joining Trend Micro ­ Some findings of this research are similar to (but not based on)
the one released by Martin et al. in April 2019
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Overview - Glossary
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Bluetooth Low Energy
 Workhorse of the Continuity protocol  Can be used to bootstrap another protocol in Continuity  Out-of-band pairing via iCloud  Use "Private resolvable address" while broadcasting
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Out-of-Band via iCloud
 Device "onboard" to each iDevice after iCloud login

Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

128-bit IRK

Private resolvable address
 A way to randomize MAC, remain recognizable to a few clients
 Address change on each on/off cycle & timeout
 AES-128 key (IRK) to identify devices
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

GATT
 Generic Attribute Profile  Used to transfer data in BLE
 128-bit UUID to identify specific resource
­ One ID for device name, one for battery level, etc ­ Specific (2) ID for Continuity
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Overview - Continuity
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Continuity protocol stack
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Continuity protocol stack
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

IDS.framework
 Apple's directory service for every(!) device  Integral part of iMessage/Continuity's encryption  Able to fetch any device's public key with corresponding
phone #/email
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Encryption
 GATT Exchanges are encrypted  RSA-1280 to decrypt AES-128 in payload  Key obtainable through IDS (iCloud) & Keychain
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Current Status of Continuity's Security
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Current Status of Continuity's Security
 Protocols with vulnerabilities before  Both used daily & might affect daily lives
­ AirDrop
 Send files to other iDevices without hassle
­ Call Relay
 Make calls from other iDevice
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

AirDrop (AWDL)
Peer-to-Peer Wi-Fi (Wi-Fi Direct)
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Status of AWDL
 User Tracking (CVE-2019-8567, CVE-2019-8620)  MitM Attack (CVE-2019-8612)
 Research & Open Source re-implementation
* https://github.com/seemoo-lab/opendrop * https://github.com/seemoo-lab/owl * Stute et al. One Billion Apples' Secret Sauce: Recipe for the Apple Wireless Direct Link Ad hoc Protocol
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Call Relay
* Vigo, 2017
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Integration is hard
 Call Relay
­ CVE-2016-4635: User interface inconsistencies in handling of relayed calls
­ CVE-2016-4721: Caller spoofing on multiparty calls ­ CVE-2016-4722: End call packet spoofing ­ CVE-2016-7577: Facetime memory corruption
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Protocol Implementation
Technical Details ahead
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Message Verification & Decryption
 Relies on Security.framework
­ Apple says obsolete
 Security Transforms
­ SecVerifyTransformCreate ­ SecDecryptTransformCreate
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Message Verification & Decryption
 SecMPVerifyAndExposeMessage
­ SecMPVerifyMessageContents(payload)
 Used when sizeof(payload) > 17
 Raw payload from HCI
­ Calls SecKeyDigestAndVerifyWithError ­ Actual decryption is called if verified
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

GATT Data Structure
 Data can be split into multiple packets  Payload length at 0x38-0x39  0x39-end = Payload + Signature  Total Length (bthci_acl.length) - Payload length =
Signature length
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Protection
 Messages are signed, but no MAC  iMessage shared IDS with continuity
­ Huffman table is used in iMessage, but not Continuity ­ iMessage Chosen Ciphertext Attack * Garmin et al. 2018
 Fixed by hashing every payload and storing it in IDSMessageHashStore, fails when dupes are received
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Decryption
 ~160 bytes = RSA-encrypted payload
­ ~16 bytes  AES-128 Key ­ 16~ bytes  Ciphertext A
 160~ bytes  Ciphertext B  AES-128 CTR, PK = 1
­ aes_decrypt(ciphertext A + ciphertext B)  gzip  binary plist
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Github Project
 https://github.com/evanslify  Currently a little script to play with broadcast only  To-do
­ Release de-encryption & encryption ­ Emulate Hotspot behavior
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Our Attack Scenario
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Attack on Continuity
 Exploits parts in-between different protocols  Some behaviors which leaks device usage, identity  Allows adversaries to track specific device  De-anonymization
 Any BLE sniffer can serve as a tracking platform
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Attack Overview
 Prerequisite: Format of Continuity broadcast  Privacy Leak
­ Device Fingerprinting
 OS Version, device type
­ Activity, Battery levels, etc
 Breaking MAC Randomization  Spoofing
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Continuity Broadcast Format
*17 types as of XCode 10.2 (PacketDecoder)
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Privacy Leak - Device Fingerprinting

 OS Version / Device type
 Specific types emitted by specific device
­ e.g. iPad Wi-Fi cannot emit Tethering Source
 https://support.apple.com/ en-gb/HT204689

Type AirPlay Target AirPrint Handoff Tethering Source Nearby

ID 0x09 0x03 0x0c 0x0e 0x10

Apple TV Printer iOS => 8 iOS => 8.1 iOS => 10

Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Privacy Leak - Active Fingerprinting
 Not a vulnarability itself  Have to connect to device
and interrogate it  Able to get model number
via GATT attributes
* Martin et. al, 2019
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Privacy Leak - Nearby
 OS Version leak
­ Format of Wi-Fi field
 Metadata, Usage leak
­ Action values
* Martin et. al, 2019
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Privacy Leak - Instant Hotspot
 Type 0x0E, Starts broadcasting after device under same Apple ID sends Tethering Source Presence (type 0x0D)
 Leaks info from broadcast
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Spoofing Instant Hotspot
 Replay & Changing bytes is possible
­ Ubertooth, faux slave mode ­ Broadcast with Public MAC ­ Find related device with known
MAC
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Breaking MAC Randomization
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Overview
 Our objective
­ To track device regardless of MAC randomization
 Breaking MAC Rotation
­ Nearby ­ Handoff ­ IRK
 Connection between private MAC ­ public MAC
­ Hotspot
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

BLE Spec
 BLE Spec recommends rotation per 15 minutes
­ Observed >15 minuted interval
 Is there any other way to track devices?
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Nearby
 Payload from Nearby is not changed immediately
­ iPad Mini 5th, iOS 12.3.1 & iPhone 7, iOS 12.4.1 ­ iPhone 11, iOS 13.2.3
 Track device's next random MAC with same payload
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Handoff
 Move app states between devices seamlessly  Payload contains App's identifier (encrypted)
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Handoff - Implementation
 Payload with AES-256-GCM
­ Keys can be sent via P2P or iCloud ­ One key per device
 No GCM tag validation  IV = Counter
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Handoff - Implementation
 Increment counter, +1 per "action"  Actions
­ Notes, Browsers, Messages ­ Goodbye (when returning to "desktop")
 Counter will NOT reset between MAC change
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

IV Reuse?
 +1 per "action"  0x0000 ­ 0xFFFF  50k-ish after 2 years of usage  Keys rotate when IV reaches 0
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

IRK Changing
 Not observed at all, even after device reset  Can be retrieved in Console.app/PacketLogger  IRK synced to other iDevice
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Connection between private MAC ­ public MAC
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Hotspot Flow
Broadcasts "Tethering Target Presense"
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Hotspot Attack Scenario

Broadcasts "Tethering Target Presense"

Mac's Public MAC to iPhone's Private MAC

Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Wi-Fi MAC of both

Hotspot Attack Scenario
 Tethering Source Presence appears after Tethering Target
­ Device A is related to device B ­ One Private MAC & Both Public MAC
 Sniffing on both BLE&Wi-Fi
­ Probe Request/Response after BLE connection
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Contextual De-Anonymization (Instant Hotspot) Attack Demo
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Practical Considerations
 Encrypt everything
­ Infrastructure are there already ­ Performance issues?
 But still no protection against
­ Attack against iCloud ­ Any compromised iDevice
 Wi-Fi Anonymization
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Practical Considerations
 Cannot protect against
­ Attack against iCloud
 IRK & Public Keys are stored on iCloud
­ Any compromised iDevice
 IRK & Public Keys is reachable from any iDevice in same apple ID
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Practical Considerations
 Wi-Fi Anonymization
­ In draft ­ MAC Randomization in
Android Q ­ Management issues?
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Black Hat Sound Bytes
 New approach to iDevice tracking  Convenience implies degree of privacy hazards  Review your implementation of new protocols carefully,
especially when integrating with another protocol
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

Thank you!
Ta-Lun Yen talun_yen@trendmicro.com @evanslify
Ta-Lun Yen | Exploring Reversing & Apple's Continuity Protocol

