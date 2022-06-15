REVERSE ENGINEERING WHATSAPP ENCRYPTION FOR CHAT MANIPULATION AND MORE
Roman Zaikin ­ Security Researcher
Oded Vanunu ­ Head of Products and Vulnerability Research

WhatsApp as evidence in court

The Communication Flow
WhatsApp Cloud

WhatsApp Behind the Scenes
ENCRYPTION: Open Whisper System -> Signal -> WhatsApp
COMMUNICATION: WebSocket -> protobuf2 -> JSON

ENCRYPTION: Open Whisper System -> Signal -> WhatsApp
On November 18, 2014, Open Whisper Systems announced a partnership with WhatsApp to provide end-to-end encryption by incorporating the Signal Protocol into each WhatsApp client platform.
On April 5, 2016, WhatsApp and Open Whisper Systems announced that they had finished adding end-to-end encryption to "every form of communication" on WhatsApp, and that users could now verify each other's keys.

COMMUNICATION: WebSocket -> protobuf2 -> JSON
The WebSocket API is an advanced technology that makes it possible to open a two-way interactive communication session between the user's browser and a server without having to poll the server for a reply.
The protobuf is a method of serializing structured data. It is useful in developing programs to communicate with each other ­ think XML, but smaller, faster, and simpler.
JSON is a JSON 

Is someone can decrypt the traffic?

WhatsApp Reversing Process
Before generating the QR code, WhatsApp Web generates a Public and Private Key that is used for encryption and decryption Process

WhatsApp Reversing Process
These keys were created by using curve25519_donna by using random 32 bytes.
In cryptography, Curve25519 is an elliptic curve offering 128 bits of security and designed for use with the elliptic curve Diffie­Hellman (ECDH) key agreement scheme. It is one of the fastest ECC curves and is not covered by any known patents

WhatsApp Reversing Process
To decrypt the data we will start to create a decryption code. This will take the private key from WhatsApp Web instead of the random bytes because we need to have the same keys in order to decrypt the data:
self.private_key = curve25519.Private("".join([chr(x) for x in priv_key_list])) self.public_key = self.private_key.get_public()

WhatsApp Reversing Process
Then, after scanning the QR code with the phone we have to take the generated secret:

WhatsApp Reversing Process ­ Shared Secret

WhatsApp Reversing Process ­ Shared Secret
Then we have 2 interesting functions: · setSharedSecret ­ This function divides the secret into slices and configure the shared secret. · E.SharedSecret ­ This function uses two parameters which were the first 32 bytes and the private
key from the QR generation:

WhatsApp Reversing Process ­ Shared Secret
Next we have the expanded shared secret which is 80 bytes:
By diving in we can see that the function uses the HKDF, is a simple hmac key derivation function (KDF) function.

WhatsApp Reversing Process ­ Shared Secret

WhatsApp Reversing Process ­ hmac_sha256
We next have the hmac validation function which takes the expanded data as parameter `e' and divides it into 3 parameters:
i ­ The first 32 bytes of shared_expended is the aes key r ­ The next 32 bytes is the hmac o ­ The last 16 bytes is the aes data part

WhatsApp Reversing Process ­ hmac_sha256

WhatsApp Reversing Process ­ hmac_sha256
Then the function HmacSha256 will be called with the parameter `r' and it will sign the data with the parameter `s', after that `n' will receive the hmac verifier which will be compared to `r'( the hmac from extended shared secret)
In python it will look like this: check_hmac = HmacSha256(shared_expended[32:64], self.secret[:32] + self.secret[64:]) if check_hmac != self.secret[32:64]:
raise ValueError("hmac mismatch")

WhatsApp Reversing Process ­ hmac_sha256

WhatsApp Reversing Process ­ AES Keys
The last encryption related function in this block is `aesCbcDecrypt' which uses two parameters: · s ­ which is a concatenation between the last 16 bytes of the expanded shared secret and the data from byte
64 of the secret. · i ­ which is the aes key.

WhatsApp Reversing Process ­ AES Keys
2
1

WhatsApp Reversing Process ­ AES Keys
This way we will get the AES Key `t' and HMAC Key `n'

WhatsApp Reversing Process ­ AES Keys

WhatsApp Reversing Process ­ Code
self.secret = None self.private_key = None self.public_key = None self.shared_secret = None self.shared_secret_ex = None self.aes_key = None
self.private_key = curve25519.Private("".join([chr(x) for x in priv_key_list])) self.public_key = self.private_key.get_public()
assert (self.public_key.serialize() == "".join([chr(x) for x in pub_key_list]))
self.secret = base64.b64decode(ref_dict["secret"]) self.shared_secret = self.private_key.get_shared_key(curve25519.Public(self.secret[:32]), lambda key: key) self.shared_secret_ex = HKDF(self.shared_secret, 80)
check_hmac = hmac_sha256(self.shared_secret_ex[32:64], self.secret[:32] + self.secret[64:]) if check_hmac != self.secret[32:64]:
raise ValueError("hmac mismatch")
key_decrypted = aes_decrypt(self.shared_secret_ex[:32], self.shared_secret_ex[64:] + self.secret[64:]) self.aes_key = key_decrypted[:32] self.mac_key = key_decrypted[32:64]

WhatsApp Reversing Process ­ protobuf data
By using the keys we can decrypt any incoming message, the decryption result will be the protobuf message.

WhatsApp Reversing Process ­ protobuf data
In order to deserialize the protobuf we have to create our mapping, based on whatsapp protobuf that can be found in the file app:

WhatsApp Reversing Process ­ protobuf data
This is a part of our protobuf file:

Burp Extension

Accessing the Keys ­ Burp Extension Keys
Let's start with WhatsApp Web. Before generating the QR code, WhatsApp Web generates a Public and Private Key that is used for encryption and decryption

Accessing the Keys ­ Burp Extension Secret
After the QR code is created, after scanning it with a phone We can send the following information to WhatsApp Web over a WebSocket.

The Extension

Decrypt the incoming data

Decrypt the incoming data
conversation ­ This is the actual content which is sent. participant ­ This is the participant that actually sent the content. fromMe ­ This parameter indicates if I sent the data or someone else in the group. remoteJid ­ This parameter indicates to which group/contact the data is sent. id ­ The id of the data. The same id will appear in the phone databases.

Decrypt the outgoing data

Decrypt the outgoing data

Decrypt the outgoing data

DEMO

Manipulation #1 ­ fake reply from someone in the group
Demo

Manipulation #2 ­ Fake reply to someone not in the group
Demo

Manipulation #3 ­ Send a private message in group chat to a specific person

Attacker

User 1

User 2

Demo

Manipulation #4: send messages to myself
Demo

THANK YOU!

